// SpryTabbedPanels.js - version 0.6 - Spry Pre-Release 1.6.1
//
// Copyright (c) 2006. Adobe Systems Incorporated.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//   * Redistributions of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//   * Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//   * Neither the name of Adobe Systems Incorporated nor the names of its
//     contributors may be used to endorse or promote products derived from this
//     software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
var busselect="no";
var proceed="no";
var Spry;
if (!Spry) Spry = {};
if (!Spry.Widget) Spry.Widget = {};

Spry.Widget.TabbedPanels = function(element, opts)
{
	this.element = this.getElement(element);
	this.defaultTab = 0; // Show the first panel by default.
	this.tabSelectedClass = "TabbedPanelsTabSelected";
	this.tabHoverClass = "TabbedPanelsTabHover";
	this.tabFocusedClass = "TabbedPanelsTabFocused";
	this.panelVisibleClass = "TabbedPanelsContentVisible";
	this.focusElement = null;
	this.hasFocus = false;
	this.currentTabIndex = 0;
	this.enableKeyboardNavigation = true;
	this.nextPanelKeyCode = Spry.Widget.TabbedPanels.KEY_RIGHT;
	this.previousPanelKeyCode = Spry.Widget.TabbedPanels.KEY_LEFT;

	Spry.Widget.TabbedPanels.setOptions(this, opts);

	// If the defaultTab is expressed as a number/index, convert
	// it to an element.

	if (typeof (this.defaultTab) == "number")
	{
		if (this.defaultTab < 0)
			this.defaultTab = 0;
		else
		{
			var count = this.getTabbedPanelCount();
			if (this.defaultTab >= count)
				this.defaultTab = (count > 1) ? (count - 1) : 0;
		}

		this.defaultTab = this.getTabs()[this.defaultTab];
	}

	// The defaultTab property is supposed to be the tab element for the tab content
	// to show by default. The caller is allowed to pass in the element itself or the
	// element's id, so we need to convert the current value to an element if necessary.

	if (this.defaultTab)
		this.defaultTab = this.getElement(this.defaultTab);

	this.attachBehaviors();
};

Spry.Widget.TabbedPanels.prototype.getElement = function(ele)
{
	if (ele && typeof ele == "string")
		return document.getElementById(ele);
	return ele;
};

Spry.Widget.TabbedPanels.prototype.getElementChildren = function(element)
{
	var children = [];
	var child = element.firstChild;
	while (child)
	{
		if (child.nodeType == 1 /* Node.ELEMENT_NODE */)
			children.push(child);
		child = child.nextSibling;
	}
	return children;
};

Spry.Widget.TabbedPanels.prototype.addClassName = function(ele, className)
{
	if (!ele || !className || (ele.className && ele.className.search(new RegExp("\\b" + className + "\\b")) != -1))
		return;
	ele.className += (ele.className ? " " : "") + className;
};

Spry.Widget.TabbedPanels.prototype.removeClassName = function(ele, className)
{
	if (!ele || !className || (ele.className && ele.className.search(new RegExp("\\b" + className + "\\b")) == -1))
		return;
	ele.className = ele.className.replace(new RegExp("\\s*\\b" + className + "\\b", "g"), "");
};

Spry.Widget.TabbedPanels.setOptions = function(obj, optionsObj, ignoreUndefinedProps)
{
	if (!optionsObj)
		return;
	for (var optionName in optionsObj)
	{
		if (ignoreUndefinedProps && optionsObj[optionName] == undefined)
			continue;
		obj[optionName] = optionsObj[optionName];
	}
};

Spry.Widget.TabbedPanels.prototype.getTabGroup = function()
{
	if (this.element)
	{
		var children = this.getElementChildren(this.element);
		if (children.length)
			return children[0];
	}
	return null;
};

Spry.Widget.TabbedPanels.prototype.getTabs = function()
{
	var tabs = [];
	var tg = this.getTabGroup();
	if (tg)
		tabs = this.getElementChildren(tg);
	return tabs;
};

Spry.Widget.TabbedPanels.prototype.getContentPanelGroup = function()
{
	if (this.element)
	{
		var children = this.getElementChildren(this.element);
		if (children.length > 1)
			return children[1];
	}
	return null;
};

Spry.Widget.TabbedPanels.prototype.getContentPanels = function()
{
	var panels = [];
	var pg = this.getContentPanelGroup();
	if (pg)
		panels = this.getElementChildren(pg);
	return panels;
};

Spry.Widget.TabbedPanels.prototype.getIndex = function(ele, arr)
{
	ele = this.getElement(ele);
	if (ele && arr && arr.length)
	{
		for (var i = 0; i < arr.length; i++)
		{
			if (ele == arr[i])
				return i;
		}
	}
	return -1;
};

Spry.Widget.TabbedPanels.prototype.getTabIndex = function(ele)
{
	var i = this.getIndex(ele, this.getTabs());
	if (i < 0)
		i = this.getIndex(ele, this.getContentPanels());
	return i;
};

Spry.Widget.TabbedPanels.prototype.getCurrentTabIndex = function()
{
	return this.currentTabIndex;
};

Spry.Widget.TabbedPanels.prototype.getTabbedPanelCount = function(ele)
{
	return Math.min(this.getTabs().length, this.getContentPanels().length);
};

Spry.Widget.TabbedPanels.addEventListener = function(element, eventType, handler, capture)
{
	try
	{
		if (element.addEventListener)
			element.addEventListener(eventType, handler, capture);
		else if (element.attachEvent)
			element.attachEvent("on" + eventType, handler);
	}
	catch (e) {}
};

Spry.Widget.TabbedPanels.prototype.cancelEvent = function(e)
{
	if (e.preventDefault) e.preventDefault();
	else e.returnValue = false;
	if (e.stopPropagation) e.stopPropagation();
	else e.cancelBubble = true;

	return false;
};

Spry.Widget.TabbedPanels.prototype.onTabClick = function(e, tab)
{
	this.showPanel(tab);
	return this.cancelEvent(e);
};

Spry.Widget.TabbedPanels.prototype.onTabMouseOver = function(e, tab)
{
	this.addClassName(tab, this.tabHoverClass);
	return false;
};

Spry.Widget.TabbedPanels.prototype.onTabMouseOut = function(e, tab)
{
	this.removeClassName(tab, this.tabHoverClass);
	return false;
};

Spry.Widget.TabbedPanels.prototype.onTabFocus = function(e, tab)
{
	this.hasFocus = true;
	this.addClassName(tab, this.tabFocusedClass);
	return false;
};

Spry.Widget.TabbedPanels.prototype.onTabBlur = function(e, tab)
{
	this.hasFocus = false;
	this.removeClassName(tab, this.tabFocusedClass);
	return false;
};

Spry.Widget.TabbedPanels.KEY_UP = 38;
Spry.Widget.TabbedPanels.KEY_DOWN = 40;
Spry.Widget.TabbedPanels.KEY_LEFT = 37;
Spry.Widget.TabbedPanels.KEY_RIGHT = 39;



Spry.Widget.TabbedPanels.prototype.onTabKeyDown = function(e, tab)
{
	var key = e.keyCode;
	if (!this.hasFocus || (key != this.previousPanelKeyCode && key != this.nextPanelKeyCode))
		return true;

	var tabs = this.getTabs();
	for (var i =0; i < tabs.length; i++)
		if (tabs[i] == tab)
		{
			var el = false;
			if (key == this.previousPanelKeyCode && i > 0)
				el = tabs[i-1];
			else if (key == this.nextPanelKeyCode && i < tabs.length-1)
				el = tabs[i+1];

			if (el)
			{
				this.showPanel(el);
				el.focus();
				break;
			}
		}

	return this.cancelEvent(e);
};

Spry.Widget.TabbedPanels.prototype.preorderTraversal = function(root, func)
{
	var stopTraversal = false;
	if (root)
	{
		stopTraversal = func(root);
		if (root.hasChildNodes())
		{
			var child = root.firstChild;
			while (!stopTraversal && child)
			{
				stopTraversal = this.preorderTraversal(child, func);
				try { child = child.nextSibling; } catch (e) { child = null; }
			}
		}
	}
	return stopTraversal;
};

Spry.Widget.TabbedPanels.prototype.addPanelEventListeners = function(tab, panel)
{
	var self = this;
	Spry.Widget.TabbedPanels.addEventListener(tab, "click", function(e) { return self.onTabClick(e, tab); }, false);
	Spry.Widget.TabbedPanels.addEventListener(tab, "mouseover", function(e) { return self.onTabMouseOver(e, tab); }, false);
	Spry.Widget.TabbedPanels.addEventListener(tab, "mouseout", function(e) { return self.onTabMouseOut(e, tab); }, false);

	if (this.enableKeyboardNavigation)
	{
		// XXX: IE doesn't allow the setting of tabindex dynamically. This means we can't
		// rely on adding the tabindex attribute if it is missing to enable keyboard navigation
		// by default.

		// Find the first element within the tab container that has a tabindex or the first
		// anchor tag.
		
		var tabIndexEle = null;
		var tabAnchorEle = null;

		this.preorderTraversal(tab, function(node) {
			if (node.nodeType == 1 /* NODE.ELEMENT_NODE */)
			{
				var tabIndexAttr = tab.attributes.getNamedItem("tabindex");
				if (tabIndexAttr)
				{
					tabIndexEle = node;
					return true;
				}
				if (!tabAnchorEle && node.nodeName.toLowerCase() == "a")
					tabAnchorEle = node;
			}
			return false;
		});

		if (tabIndexEle)
			this.focusElement = tabIndexEle;
		else if (tabAnchorEle)
			this.focusElement = tabAnchorEle;

		if (this.focusElement)
		{
			Spry.Widget.TabbedPanels.addEventListener(this.focusElement, "focus", function(e) { return self.onTabFocus(e, tab); }, false);
			Spry.Widget.TabbedPanels.addEventListener(this.focusElement, "blur", function(e) { return self.onTabBlur(e, tab); }, false);
			Spry.Widget.TabbedPanels.addEventListener(this.focusElement, "keydown", function(e) { return self.onTabKeyDown(e, tab); }, false);
		}
	}
};

Spry.Widget.TabbedPanels.prototype.showPanel = function(elementOrIndex)
{
	var tpIndex = -1;
	
	if (typeof elementOrIndex == "number")
		tpIndex = elementOrIndex;
	else // Must be the element for the tab or content panel.
		tpIndex = this.getTabIndex(elementOrIndex);
	
	if (!tpIndex < 0 || tpIndex >= this.getTabbedPanelCount())
		return;

	var tabs = this.getTabs();
	var panels = this.getContentPanels();

	var numTabbedPanels = Math.max(tabs.length, panels.length);

	for (var i = 0; i < numTabbedPanels; i++)
	{
		if (i != tpIndex)
		{
			if (tabs[i])
				this.removeClassName(tabs[i], this.tabSelectedClass);
			if (panels[i])
			{
				this.removeClassName(panels[i], this.panelVisibleClass);
				panels[i].style.display = "none";
			}
		}
	}

	this.addClassName(tabs[tpIndex], this.tabSelectedClass);
	this.addClassName(panels[tpIndex], this.panelVisibleClass);
	panels[tpIndex].style.display = "block";

	this.currentTabIndex = tpIndex;
};

Spry.Widget.TabbedPanels.prototype.attachBehaviors = function(element)
{
	var tabs = this.getTabs();
	var panels = this.getContentPanels();
	var panelCount = this.getTabbedPanelCount();

	for (var i = 0; i < panelCount; i++)
		this.addPanelEventListeners(tabs[i], panels[i]);

	this.showPanel(this.defaultTab);
};




function getRequestObject(){
	
	if(window.XMLHttpRequest){
		return(new XMLHttpRequest());
	}else if(window.ActiveXObject){
		return(new ActiveXObject("Microsoft.XMLHTTP"));
	}
	else{
		return(null);
	}
}

function getAreaDetails(){
	document.getElementById("area_new").style.visibility="hidden";
	document.getElementById("area_delete").style.visibility="visible";
	document.getElementById("area_modify").style.visibility="visible";
	var Area_list=document.getElementById("area_list").value;
	var area="arealist="+Area_list;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseclick(request)};
	request.open("POST","transportdetailsclick.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(area);
}

function handleResponseclick(request){
	if(request.readyState==4){
			a=request.responseText;
			a1=String(a);
			a2=a1.split("$");
			document.area_master.area_code.value=a2[1];
			document.area_master.area_name.value=a2[2];
			document.area_master.area_fee.value=a2[3];
	}		
}

var i=0;
function Validation1(){
	
	var area_name=document.getElementById("area_name").value;
	var re=new RegExp(/^[a-z|A-Z]/);
	if(area_name==""|| area_name==null){
 
			alert("area_name should not be empty");
			document.getElementById("area_name").focus();
			i=0;
			}
		else if(!re.test(area_name)){
			alert("name should start with a letter");
			document.getElementById("area_name").focus();
			document.getElementById("area_name").select();i=0;
		 
			}
		else if(area_name.length>=15){
			alert("should contain a maximum of 15 characters");
			document.getElementById("area_name").focus();
			document.getElementById("area_name").select();i=0;
			
			}
		else{
			i=1;
			
		
			}
}
function Validation2(){
	var area_fee=document.getElementById("area_fee").value;
	var re1=new RegExp(/^[0-9]/);
	if(area_fee==""|| area_fee==null){
			xyz1.innerText="area_fee should not be empty";
			document.getElementById("area_fee").focus();
	}
	else if(!re1.test(area_fee)){
			xyz1.innerText="fee should contain no only";
			document.getElementById("area_fee").focus();
			document.getElementById("area_fee").select();
	}
	else
		xyz1.innerText="valid";
}
function getalll(){
	document.getElementById("area_new").style.visibility="visible";
	document.getElementById("area_modify").style.visibility="hidden";
	document.getElementById("area_delete").style.visibility="hidden";
	document.getElementById("area_save").style.visibility="hidden";
}

function val(){
	document.getElementById("area_new").style.visibility="hidden";
	document.getElementById("area_save").style.visibility="visible";

	var req=getRequestObject();
  	req.onreadystatechange=function(){handleResponse(req);}
  	req.open("GET","getid1.jsp",true);
  	req.send(null);
}
function handleResponse(req){
		if(req.readystate==4){
 				var s=req.responseText;
				document.getElementById("area_code").value=s;
				document.getElementById("area_name").value="";
				document.getElementById("area_fee").value="";
		 }
}
function modify(){
if(i==1){
i=0;
	var area_code=document.getElementById("area_code").value;
	var area_name=document.getElementById("area_name").value;
	var area_fee=document.getElementById("area_fee").value;
	var areadetails="area_code="+area_code+"&area_name="+area_name+"&area_fee="+area_fee;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseModify(request,area_name)};
	request.open("POST","AreaModify1.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(areadetails);
	}
	else alert("give corect details");
}

function handleResponseModify(req){
  if(req.readystate==4){
  
 		var s=req.responseText;
 	
 	
 		document.getElementById("area_list").length=0;
		var words=s.split("$");
		 for(i=1;i<words.length-1;i++){ 
			addOption(document.getElementById("area_list") ,words[i],words[i]);
		}
		
		var last=words[i];
	
		last=last.substring(0,last.length-3);
	
	
		var option=document.createElement("OPTION");
		option.text=last;
		option.value=last;
		document.getElementById("area_list").options.add(option);
	}
}
function addOption(sBox,text,value){
	var option=document.createElement("OPTION");
	option.text=text;
	option.value=value;
	sBox.options.add(option);
}
function save(){
if(i==0) alert("give correct details");
else {

	document.getElementById("area_new").style.visibility="visible";
	document.getElementById("area_save").style.visibility="hidden";
	var area_code=document.getElementById("area_code").value;
	var area_name=document.getElementById("area_name").value;
	var area_fee=document.getElementById("area_fee").value;
	var areadetails="area_code="+area_code+"&area_name="+area_name+"&area_fee="+area_fee;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseArea(request,area_name)};
	request.open("POST","AreaMaster.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(areadetails);

	}
}
 function handleResponseArea(req,a){
 		if(req.readystate==4){
 				var s=req.responseText;
				var option=document.createElement("OPTION");
				option.text=a;
				option.value=a;
				document.getElementById("area_list").options.add(option);
				document.getElementById("area_code").value="";
				document.getElementById("area_name").value="";
				document.getElementById("area_fee").value="";
		}
}
function getDelete(){i=0;
	var area_name=document.getElementById("area_list").value;
	document.getElementById("area_code").value="";
	document.getElementById("area_name").value="";
	document.getElementById("area_fee").value="";
	var area_name="area_name="+area_name;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseDelete(request)};
	request.open("POST","Delete.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(area_name);
}
function handleResponseDelete(req){
  if(req.readystate==4){
  
 		var s=req.responseText;
 	
 		
 		document.getElementById("area_list").length=0;
		var words=s.split("$");
		 for(i=1;i<words.length;i++){ 
			addOption(document.getElementById("area_list") ,words[i],words[i]);
		}
	}	
	
}
function getDetailsBus(){
	var Bus_no=document.getElementById("bus_num").value;
	document.bus_master.bus_numt.value=document.getElementById("bus_num").value;
	
	var bus="busno="+Bus_no;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponsebus(request)};
	request.open("POST","transportdetailsbus.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(bus);
}
function handleResponsebus(request){
	if(request.readyState==4){
		a=request.responseText;
		
		a1=String(a);
		a2=a1.split("$");
	
		document.bus_master.num_of_seats.value=a2[1];
		document.bus_master.layout_name.value=a2[2];
		document.bus_master.driver_name.value=a2[3];
		document.bus_master.driver_mob.value=a2[4];
		document.bus_master.faculty_name.value=a2[5];
		document.bus_master.faculty_mob.value=a2[6];
		document.bus_master.coordinator_name.value=a2[7];
		document.bus_master.coordinator_mob.value=a2[8];
		document.bus_master.incharge_name.value=a2[9];
		document.bus_master.incharge_mob.value=a2[10];
	
 		
 		
	}		
}
function showbusnumtextbox(){

	document.getElementById("bus_num_t").style.visibility='visible';
	document.bus_master.num_of_seats.value="";
		document.bus_master.layout_name.value="";
		document.bus_master.driver_name.value="";
		document.bus_master.driver_mob.value="";
		document.bus_master.faculty_name.value="";
		document.bus_master.faculty_mob.value="";
		document.bus_master.coordinator_name.value="";
		document.bus_master.coordinator_mob.value="";
		document.bus_master.incharge_name.value="";
		document.bus_master.incharge_mob.value="";
	
}
function hideBusText(){

	var bus_num=document.getElementById("bus_numt").value;
	
	document.getElementById("bus_num_t").style.visibility='hidden';
	var seats=document.getElementById("num_of_seats").value;
	
	var layout_name=document.getElementById("layout_name").value;
	var driver_name=document.getElementById("driver_name").value;
	
	var driver_mob=document.getElementById("driver_mob").value;
	
	var faculty_name=document.getElementById("faculty_name").value;
	
	var faculty_mob=document.getElementById("faculty_mob").value;
	var coordinator_name=document.getElementById("coordinator_name").value;
	var coordinator_mob=document.getElementById("coordinator_mob").value;
	var incharge_name=document.getElementById("incharge_name").value;
	var incharge_mob=document.getElementById("incharge_mob").value;
	
	var busdetails="bus_num="+bus_num+"&num_of_seats="+seats+"&layout_name="+layout_name+"&driver_name="+driver_name+"&driver_mob="+driver_mob+"&faculty_name="+faculty_name+"&faculty_mob="+faculty_mob+"&coordinator_name="+coordinator_name+"&coordinator_mob="+coordinator_mob+"&incharge_name="+incharge_name+"&incharge_mob="+incharge_mob;
	
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseinsertBus(request)};
	request.open("POST","Insertbus.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(busdetails);
	
}
function handleResponseinsertBus(request){
if(request.readystate==4){
	document.getElementById("num_of_seats").value="";
	
	document.getElementById("driver_name").value="";
	document.getElementById("driver_mob").value="";
	document.getElementById("faculty_name").value="";
	document.getElementById("faculty_mob").value="";
	document.getElementById("coordinator_name").value="";
	document.getElementById("coordinator_mob").value="";
	document.getElementById("incharge_name").value="";
	document.getElementById("incharge_mob").value="";
	
	
 		var s=request.responseText;
 	
 		var both=s.split("&");
 		
 		bus=both[0];
 		
 		layout=both[1];
 		var buses=bus.split("$");
 		
 		var layouts=layout.split("$");
 		
 		document.getElementById("bus_num").length=0;
 		document.getElementById("layout_name").length=0;
 		var optionb=document.createElement("OPTION");
 		optionb.value="Select";
 		optionb.text="Select";
 		document.getElementById("bus_num").options.add(optionb);
 		var optionl=document.createElement("OPTION");
 		optionl.value="Select layout";
 		optionl.text="Select layout";
 		document.getElementById("layout_name").options.add(optionl);
 		for(i=1;i<buses.length;i++){ 
			addOption(document.getElementById("bus_num") ,buses[i],buses[i]);
		}
 		for(i=1;i<layouts.length;i++){ 
			addOption(document.getElementById("layout_name") ,layouts[i],layouts[i]);
		}
 		
 	
	}
}
function getDeleteBus(){
	var bus_num=document.getElementById("bus_num").value;
	
	var bus_num="bus_num1="+bus_num;
	
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseDeleteBus(request)};
	request.open("POST","DeleteBus1.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(bus_num);
}
function handleResponseDeleteBus(req){
  	if(req.readystate==4){
  	
 		var s=req.responseText;
 		
 		document.getElementById("num_of_seats").value="";
		document.getElementById("driver_name").value="";
		document.getElementById("driver_mob").value="";
		document.getElementById("faculty_name").value="";
		document.getElementById("faculty_mob").value="";
		document.getElementById("coordinator_name").value="";
		document.getElementById("coordinator_mob").value="";
		document.getElementById("incharge_name").value="";
		document.getElementById("incharge_mob").value="";
		var both=s.split("&");
 		
 		bus=both[0];
 		
 		
 		layout=both[1];
 		var buses=bus.split("$");
 		
 		var layouts=layout.split("$");
 		
 		document.getElementById("bus_num").length=0;
 		document.getElementById("layout_name").length=0;
 		var optionb=document.createElement("OPTION");
 		optionb.value="Select";
 		optionb.text="Select";
 		document.getElementById("bus_num").options.add(optionb);
 		var optionl=document.createElement("OPTION");
 		optionl.value="Select layout";
 		optionl.text="Select layout";
 		document.getElementById("layout_name").options.add(optionl);
 		for(i=1;i<buses.length;i++){ 
			addOption(document.getElementById("bus_num") ,buses[i],buses[i]);
		}
 		for(i=1;i<layouts.length;i++){ 
			addOption(document.getElementById("layout_name") ,layouts[i],layouts[i]);
		}
		
	}
}
function selectBus(){
	busselect="yes";
	var bus=document.getElementById("bus_menu").value;
}
function selectRoute(){
	if(busselect=="no"){
		alert("select a bus");
	}else{
		var route=document.getElementById("route_menu").value;
		 proceed="yes";

	}
}
function saveStage(){
	var stage=document.getElementById("stage_name").value;
 if(proceed=="yes"&&stage!=""){
	var route=document.getElementById("route_menu").value;
	var busnumber=document.getElementById("bus_menu").value;
	var stagename=document.getElementById("stage_name").value;
	var route1="route="+route+"&busno="+busnumber+"&stagename="+stagename;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseroute(request)};
	request.open("POST","transportdetailsroute.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(route1);
	}
	else alert("select correctly");
}
function handleResponseroute(request){
	if(request.readyState==4){
		res=request.responseText;
		
		var fillspan=document.getElementById("fillMe");
		fillspan.innerHTML=res;
	
		
	}		
}
function showStage(){
 
	var route=document.getElementById("route_menu").value;
	var busnumber=document.getElementById("bus_menu").value;
	
	var route1="route="+route+"&busno="+busnumber;
	request=getRequestObject();
	request.onreadystatechange=function(){ handleResponseroute(request)};
	request.open("POST","transportdetailsroute.jsp",true);
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(route1);

	
}
function changestatus(){
	changed="yes";
}
function showLayoutText(){
	
	document.getElementById("layouttext").style.visibility='visible';
	
}
function hideLayoutText(){
	
	var layout=document.getElementById("layouttext").value;
	
	document.getElementById("layouttext").style.visibility='hidden';
	var area="arealist="+layout;
	request=getRequestObject();
	
	request.onreadystatechange=function(){ handleResponseinsertlayout(request)};
	
	request.open("POST","InsertLayout.jsp",true);
	
	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	request.send(area);
	
}
function handleResponseinsertlayout(req){
	  if(req.readystate==4){
 		var s=req.responseText;
 		document.getElementById("layoutList").length=0;
 		var option=document.createElement("OPTION");
 		option.value="Select";
 		option.text="Select";
 		document.getElementById("layoutList").options.add(option);
		var words=s.split("$");
		
		var option=document.createElement("OPTION");
	first=words[0];
	first=first.substring(4,first.length);
	option.text=first;
	option.value=first;
	document.getElementById("layoutList").options.add(option);
		 for(i=1;i<=words.length-2;i++){ 
			addOption(document.getElementById("layoutList") ,words[i],words[i]);
		}
	}
}
function deleteLayout(){
	if(changed=="no"){
		alert("select any layout");
	}else if(document.getElementById("layoutList")=="Select")
		alert("select any Layout");
	
	
	else if(changed=="yes"){
		var layouts=document.getElementById("layoutList").value;
		
		var layoutd="layout="+layouts;
	
		request=getRequestObject();
	
		request.onreadystatechange=function(){ handleResponseLayoutDelete(request)};
	
		request.open("POST","DeleteLayout.jsp",true);
	
		request.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		request.send(layoutd);
		
		}
}
function handleResponseLayoutDelete(req){
  if(req.readystate==4){
 		var s=req.responseText;
 		document.getElementById("layoutList").length=0;
 		var option=document.createElement("OPTION");
 		option.value="Select";
 		option.text="Select";
 		document.getElementById("layoutList").options.add(option);
		var words=s.split("$");
		var first=words[0];
		
		first=first.substring(4,first.length);
		
		var option=document.createElement("OPTION");
	option.text=first;
	option.value=first;
	document.getElementById("layoutList").options.add(option);
		 for(i=1;i<words.length;i++){ 
			addOption(document.getElementById("layoutList") ,words[i],words[i]);
		}
	}
}
function fun(){
	var name= document.getElementById("area_fee").value;
	
	if(name=="")
	alert("should not empty fill with nmbers only");
	

}

  function isNumberKey(evt)
  {
      	 var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
             return true;
        
      }
      