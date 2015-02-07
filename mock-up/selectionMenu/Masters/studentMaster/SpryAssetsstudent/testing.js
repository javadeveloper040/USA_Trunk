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

                         //validation for email
function echeck(str) {

		var at="@";
		var dot=".";
		var lat=str.indexOf(at);
		var lstr=str.length;
		var ldot=str.indexOf(dot);
		if (str.indexOf(at)==-1){
		   alert("Invalid E-mail ID");
		   return false;
		}

		if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID");
		   return false;
		}

		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID");
		    return false;
		}

		 if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID");
		    return false;
		 }

		 if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID");
		    return false;
		 }

		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID");
		    return false;
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID");
		    return false;
		 }

 		 return true	;				
	}
	
	function ValidateForm(){
	var emailID1=document.getElementById("email");
	if (echeck(emailID1.value)==false){
		emailID1.value="";
		emailID1.focus();
		return false;
	}
	var emailID2=document.getElementById("email");
	if (echeck(emailID2.value)==false){
		emailID2.value="";
		emailID2.focus();
		return false;
	}
	return true;
 }
	                	//end of email validation                         
                         
function val()
{

   alert("entering into the val");
              //validation of general details
               var roll=document.getElementById("rollno").value;
              if(roll=="")
              {
              alert("enter the roll number");
              document.studentmaster.rollno.focus();
              return false;
              }
               if(document.getElementById("admissionnum").value=="")
              {
              alert("enter the admission number");
              document.studentmaster.admissionnum.focus();
              return false;
              }
               if(document.getElementById("fullname").value=="")
              {
              alert("enter the full name of the student");
              document.studentmaster.fullname.focus();
              return false;
              }
                            
              //end of validation of general details
                   //validation of admission details
var one=document.getElementById("admntyp1").checked;
 var three=document.getElementById("admntyp2").checked;
 var four=document.getElementById("admntyp3").checked;
var two=document.getElementById("admntyp4").checked;
if(!((one)||(two)||(three)||(four)))
{
alert("enter admission type correctly");
return false;
}
if(document.getElementById("catadmission").value=="0")
{
alert("enter the ctaegory of the admission");
document.studentmaster.catadmission.focus();
return false;
}
if(document.getElementById("seat").value=="0")
{
alert("enter the seat type correctly");
document.studentmaster.seat.focus();
return false;
}
if(document.getElementById("religion").value=="0")
{
alert("enter the Religion & caste correctly");
document.studentmaster.religion.focus();
return false;
}
if(document.getElementById("category").value=="")
{
alert("enter the category correctly");
document.studentmaster.category.focus();
return false;
}
if(document.getElementById("castename").value=="")
{
alert("enter the castename correctly");
document.studentmaster.castename.focus();
return false;
}

if(document.getElementById("admissiondate").value=="")
{
alert("enter the admissiondate correctly");
document.studentmaster.admissiondate.focus();
return false;
}


if(document.getElementById("dob").value=="")
{
alert("enter the dob correctly");
document.studentmaster.dob.focus();
return false;
}


if(document.getElementById("parentname").value=="")
{
alert("enter the parentname correctly");
document.studentmaster.parentname.focus();
return false;
}


if(document.getElementById("occupation").value=="")
{
alert("enter the occupation");
document.studentmaster.occupation.focus();
return false;
}


if(document.getElementById("land").value=="")
{
alert("enter the home land");
document.studentmaster.land.focus();
return false;
}
else
{
if(isNaN(document.getElementById("land").value))
{
alert("enter correct number");
document.studentmaster.land.focus();
return false;
}
}


if(document.getElementById("parentmobile").value=="")
{
alert("enter the parentmobile");
document.studentmaster.parentmobile.focus();
return false;
}
else
{
if(isNaN(document.getElementById("parentmobile").value))
{
alert("enter correct number");
document.studentmaster.parentmobile.focus();
return false;
}
}


if(document.getElementById("studentmobile").value=="")
{
alert("enter the studentmobile");
document.studentmaster.studentmobile.focus();
return false;
}
else
{
if(isNaN(document.getElementById("studentmobile").value))
{
alert("enter correct number");
document.studentmaster.studentmobile.focus();
return false;
}
}


var emailID=document.getElementById("email");
	
	if ((emailID.value==null)||(emailID.value=="")){
		alert("Please Enter your Email ID");
		ValidateForm();
		emailID.focus();
		return false;
	}

var emailID3=document.getElementById("aemail");
	
	if ((emailID3.value==null)||(emailID3.value=="")){
		alert("Please Enter your Alternate Email ID");
		ValidateForm();
		emailID3.focus();
		return false;
	}

if(document.getElementById("doorno").value=="")
{
    alert("enter the door number compulsory");
    document.studentmaster.doorno.focus();
return false;
}
if(document.getElementById("street").value=="")
{
    alert("enter the street");
    document.studentmaster.street.focus();
return false;
}
if(document.getElementById("area").value=="")
{
    alert("enter the area");
    document.studentmaster.area.focus();
return false;
}

if(document.getElementById("dt").value=="")
{
    alert("enter the district");
    document.studentmaster.dt.focus();
return false;
}
if(document.getElementById("pin").value=="")
{
    alert("enter the pincode");
    var len=document.getElementById("pin").value;
    if(len.length!=6)
    {
     alert("pincode must not be length of 6");
     document.studentmaster.pin.value="";
    }
    document.studentmaster.pin.focus();
return false;

}
if(document.getElementById("Qualifyingtest").value=="")
{
    alert("enter the Qualifyingtest");
    document.studentmaster.Qualifyingtest.focus();
return false;
}
if(document.getElementById("rank").value=="")
{
    alert("enter the qulifying test rank");
    document.studentmaster.rank.focus();
return false;
}
if(document.getElementById("hallticketno").value=="")
{
    alert("enter the hallticket number");
   
return false;
}
if(document.getElementById("sschallticketno").value=="")
{
    alert("enter the sschallticket number");
 
return false;
} 
 if(document.getElementById("mothertongue").value=="0")
 {
   alert("select the mother tongue");
   return false;
 }
if(document.getElementById("mole1").value=="")
{
    alert("enter the identification mark1");
  
return false;
}
if(document.getElementById("mole2").value=="")
{
    alert("enter the identification mark1");
 
return false;
}
                                  //end of validation of admission details
                                  
                                  //validation of academic and personal details
  if(document.getElementById("pdoorno").value=="")
  {
    alert("enter the permanet address door number");
    document.studentmaster.pdoorno.focus();
    return false;
  }
  if(document.getElementById("pstreet").value=="")
  {
    alert("enter the permanet address street name");
    document.studentmaster.pstreet.focus();
    return false;
  }
  if(document.getElementById("parea").value=="")
  {
    alert("enter the permanet address area name");
    document.studentmaster.parea.focus();
    return false;
  }
  if(document.getElementById("pdistrict").value=="")
  {
    alert("enter the permanet address district name");
    document.studentmaster.pdistrict.focus();
    return false;
  }
  if(document.getElementById("ppin").value=="")
  {
    alert("enter the permanet address area pincode");
    document.studentmaster.ppin.focus();
    return false;
  }
    if(document.getElementById("addc").value=="")
  {
    alert("enter the correspondence address details fully");
    document.studentmaster.addc.focus();
    return false;
  }
      if(document.getElementById("addp").value=="")
  {
    alert("enter the permanet address details fully");
    document.studentmaster.addp.focus();
    return false;
  }
      if(document.getElementById("bg").value=="")
  {
    alert("enter the blood group");
    document.studentmaster.bg.focus();
    return false;
  }
      if(document.getElementById("acno").value=="")
  {
    alert("enter the accountnumber");
    document.studentmaster.acno.focus();
    return false;
  }
       if(document.getElementById("bankname").value=="")
  {
    alert("enter the bank name");
    document.studentmaster.bankname.focus();
    return false;
  }
      if(document.getElementById("bankbranch").value=="")
  {
    alert("enter the branch name of the bank");
    document.studentmaster.bankbranch.focus();
    return false;
  }
 
  if(document.getElementById("disc").checked)
  {
       if(document.getElementById("ddate").value=="")
       {
        alert("enter the discontinued date");
        document.studentmaster.ddate.focus();
      return false;
       }
     if(document.getElementById("ldate").value=="")
      {
       alert("enter the leaving  date");
       document.studentmaster.ldate.focus();
     return false;
     }
       return false;
  } 
  if(!(document.getElementById("bno").checked))
  {
    if(document.getElementById("bregdate").value=="")
    {
      alert("enter the registered date for bus");
      document.studentmaster.bregdate.focus();
      return false;
     }
    if(document.getElementById("busarea").value=="0")
     {
      alert("select the area for bus stop");
      document.studentmaster.busarea.focus();
      return false;
     }
    if(document.getElementById("busno").value=="0")
    {
      alert("select the bus number");
      document.studentmaster.busno.focus();
      return false;
    }
     if(document.getElementById("bcdate").value=="")
    {
      alert("enter the cancellation date for bus");
      document.studentmaster.bcdate.focus();
      return false;
    }
      return false;
  }
  if(!(document.getElementById("ano").checked))
  {
    if(document.getElementById("accregdate").value=="")
    {
     alert("enter the registered date for accomodation");
     document.studentmaster.accregdate.focus();
    }
    if(document.getElementById("acchostelname").value=="0")
    {
     alert("select the hostel name for accomodation");
     document.studentmaster.acchostelname.focus();
    }
    if(document.getElementById("accroomno").value=="0")
   {
     alert("select the room number for accomodation");
     document.studentmaster.accroomno.focus();
   } 
    if(document.getElementById("guardian").value=="")
     {
      alert("enter the guardian name for accomodated hostel");
      document.studentmaster.guardian.focus();
    }
    if(document.getElementById("accphno").value=="")
      {
       alert("enter the phone number of accomodated hostel");
       document.studentmaster.accphno.focus();
     }
     if(document.getElementById("acccdate").value=="")
     {
      alert("enter the cancel dateof accomodation");
      document.studentmaster.acccdate.focus();
     }
       return false;
   }
 
                 //validation for ssc qualification 
   if(document.getElementById("ssc").checked)
   {
  
        if(document.getElementById("sscins").value=="")
          {
           alert("enter the ssc institution name");
           document.studentmaster.sscins.focus();
             return false;
          }
          if(document.getElementById("sscmedium").value=="0")
          {
           alert("enter the ssc medium");
           document.studentmaster.sscmedium.focus();
             return false;
          }
          if(document.getElementById("sscdivision").value=="0")
          {
           alert("enter the ssc division");
           document.studentmaster.sscdivision.focus();
            return false;
          }
          if(document.getElementById("sscpercentage").value=="")
          {
           alert("enter the ssc percentage");
           document.studentmaster.sscpercentage.focus();
            return false;
          }
          if(document.getElementById("sscyear").value=="")
          {
           alert("enter the ssc year of completion");
           document.studentmaster.sscyear.focus();
            return false;
          }
        
   }
   
   
               // validation for intermediate qualification
     
    if(document.getElementById("inter").checked)
   {
        if(document.getElementById("interins").value=="")
          {
           alert("enter the intermediate institution name");
           document.studentmaster.interins.focus();
           return false;
          }
          if(document.getElementById("intermedium").value=="0")
          {
           alert("enter the  intermediate medium");
           document.studentmaster.intermedium.focus();
           return false;
          }
          if(document.getElementById("interdivision").value=="0")
          {
           alert("enter the intermediate division");
           document.studentmaster.interdivision.focus();
           return false;
          }
          if(document.getElementById("interpercentage").value=="")
          {
           alert("enter the intermediate percentage");
           document.studentmaster.interpercentage.focus();
           return false;
          }
          if(document.getElementById("interyear").value=="")
          {
           alert("enter the intermediate year of completion");
           document.studentmaster.interyear.focus();
           return false;
          }
         
   } 
                 //validation for diploma qualification
      if(document.getElementById("diploma").checked)
   {
        if(document.getElementById("diplomains").value=="")
          {
           alert("enter the diploma institution name");
           document.studentmaster.diplomains.focus();
           return false;
          }
          if(document.getElementById("diplomamedium").value=="0")
          {
           alert("enter the diploma medium");
           document.studentmaster.diplomamedium.focus();
           return false;
          }
          if(document.getElementById("diplomadivision").value=="0")
          {
           alert("enter the diploma division");
           document.studentmaster.diplomadivision.focus();
           return false;
          }
          if(document.getElementById("diplomapercentage").value=="")
          {
           alert("enter the diploma percentage");
           document.studentmaster.diplomapercentage.focus();
           return false;
          }
          if(document.getElementById("diplomayear").value=="")
          {
           alert("enter the diploma year of completion");
           document.studentmaster.diplomayear.focus();
           return false;
          }
         
   }
             //validation for degree qualification 
   if(document.getElementById("degree").checked)
   {
        if(document.getElementById("degreeins").value=="")
          {
           alert("enter the degree institution name");
           document.studentmaster.degreeins.focus();
           return false;
          }
          if(document.getElementById("degreemedium").value=="0")
          {
           alert("enter the degree medium");
           document.studentmaster.degreemedium.focus();
           return false;
          }
          if(document.getElementById("degreedivision").value=="0")
          {
           alert("enter the degree division");
           document.studentmaster.degreedivision.focus();
           return false;
          }
          if(document.getElementById("degreepercentage").value=="")
          {
           alert("enter the degree percentage");
           document.studentmaster.degreepercentage.focus();
           return false;
          }
          if(document.getElementById("degreeyear").value=="")
          {
           alert("enter the degree year of completion");
           document.studentmaster.degreeyear.focus();
           return false;
          }
         
   }
   
    //validation for ug qualification 
   if(document.getElementById("ug").checked)
   {
        if(document.getElementById("ugins").value=="")
          {
           alert("enter the ug institution name");
           document.studentmaster.ugins.focus();
           return false;
          }
          if(document.getElementById("ugmedium").value=="0")
          {
           alert("enter the ug medium");
           document.studentmaster.ugmedium.focus();
           return false;
          }
          if(document.getElementById("ugdivision").value=="0")
          {
           alert("enter the ug division");
           document.studentmaster.ugdivision.focus();
           return false;
          }
          if(document.getElementById("ugpercentage").value=="")
          {
           alert("enter the ug percentage");
           document.studentmaster.ugpercentage.focus();
           return false;
          }
          if(document.getElementById("ugyear").value=="")
          {
           alert("enter the ug year of completion");
           document.studentmaster.ugyear.focus();
           return false;
          }
         
   }
   alert("end ");
                              //end of validation of academic and personal details
                      
}


// function checking  year
function checkyear123()
{
  var dt=document.getElementById("admissiondate").value;
   if(dt=="")
   {
    alert("enter date");
    return false;
   }
  else
  {
  var str=dt.substring(6);
  var i=parseInt(str)+4;
  document.getElementById("complete").value=i;
  return false;
  }
}
    
 

		            //merging address details from correspondance
function correspond()
{
  if(document.getElementById("mergec").checked)
  {
   var door=document.getElementById("doorno").value;
   var street=document.getElementById("street").value;
   var area=document.getElementById("area").value;
   var dt=document.getElementById("dt").value;
   var pin=document.getElementById("pin").value;
   document.getElementById("addc").value="Door no:"+door+", Street:"+street+", Area:"+area+",District:"+dt+",Pin:"+pin;
   return false;
 }
 else
 {
      document.getElementById("addc").value="";
      return false;
 }
}
                     //merging address details from permanent
function permanent()
{
  if(document.getElementById("mergep").checked)
  {
   var door=document.getElementById("pdoorno").value;
   var street=document.getElementById("pstreet").value;
   var area=document.getElementById("parea").value;
   var dt=document.getElementById("pdistrict").value;
   var pin=document.getElementById("ppin").value;
   document.getElementById("addp").value="Door no:"+door+", Street:"+street+", Area:"+area+",District:"+dt+",Pin:"+pin;
   return false;
 }
 else
 {
      document.getElementById("addp").value="";
      return false;
 }
}
                    

                    //checking of bus facitlity
function availability()
{

 if(document.getElementById("bno").checked)
 {
  document.getElementById("bregdate").disabled=true;
  document.getElementById("busarea").disabled=true;
  document.getElementById("busno").disabled=true;
  document.getElementById("bcdate").disabled=true;
  return false;
  }
  else if(document.getElementById("byes").checked)
   {
    document.getElementById("bregdate").disabled=false;
	document.getElementById("busarea").disabled=false;
	document.getElementById("busno").disabled=false;
	document.getElementById("bcdate").disabled=false;
	return false;
   }
}
  //checking accomodation availability
function checkavail()
{

    if(document.getElementById("ano").checked)
	{
		document.getElementById("accregdate").disabled=true;
		
		document.getElementById("acchostelcode").disabled=true;
		document.getElementById("accroomno").disabled=true;
		document.getElementById("accphno").disabled=true;
		document.getElementById("guardian").disabled=true;
		document.getElementById("acccdate").disabled=true;
	  
		return false;
	}
	else if(document.getElementById("ayes").checked)
	{
	 
		document.getElementById("accregdate").disabled=false;
		
		document.getElementById("acchostelcode").disabled=false;
		document.getElementById("accroomno").disabled=false;
		document.getElementById("accphno").disabled=false;
		document.getElementById("guardian").disabled=false;
		document.getElementById("acccdate").disabled=false;
		return false;
	}
}
 				//checking the discontinution date field
 function checkdisc()
 {
     if(document.getElementById("disc").checked)
     {
        document.getElementById("ddate").disabled=false;
	    document.getElementById("ldate").disabled=false;
	    return false;
     }
    else
     {
       document.getElementById("ddate").disabled=true;
       document.getElementById("ddate").value="disabled";
	   document.getElementById("ldate").disabled=true;
	   return false;
     }
 }
 
             //function for same address;
function checkthis()
{
          var on=document.getElementById("same").checked;
        
          if(on==true){
       document.getElementById("pdoorno").value=document.getElementById("doorno").value;
       document.getElementById("pstreet").value=document.getElementById("street").value;
       document.getElementById("parea").value=document.getElementById("area").value;
       document.getElementById("pdistrict").value=document.getElementById("dt").value;
       document.getElementById("ppin").value=document.getElementById("pin").value;
       return false;
       }
       else{
        document.getElementById("pdoorno").value="";
       document.getElementById("pstreet").value="";
       document.getElementById("parea").value="";
       document.getElementById("pdistrict").value="";
       document.getElementById("ppin").value="";
       return false;
       }
}
    
     
      //function for checking the bus cancellation date and registered date
      
      function busregcan()
      {
      var reg=document.getElementById("bregdate").value;
      var cal=document.getElementById("bcdate").value;
       if((reg.length!=10)||(cal.length!=10))
        {
           alert("enter the bus register and cancellation dates correctly");
           return false;     
        }
        else
        { 
        var x=reg.split("/");
        var y=cal.split("/");
        var dd1=parseInt(x[0],10);
        var mm1=parseInt(x[1],10);
        var dd2=parseInt(y[0],10);
        var mm2=parseInt(y[1],10);
        if((mm1==1)||(mm1==3)||(mm1==5)||(mm1==7)||(mm1==8)||(mm1==10)||(mm1==12))
         {
            if(dd1>31)
            {
             alert("enter the correct the day in the registered date");
            
             return false;
             }
             return false;
         }
         else
         {
            if(dd2>30)
            {
             alert("enter the correct the day in the cancellation date");
             return false;
             }
             return false;
         }
         if(mm1>12){
           alert("month must not be greater than 12 in registered date");
           return false;
           }
           if(mm2>12)
           {
           alert("month must not be greater than 12 in cancellation date");
            return false;
           }
         var i1=parseInt(x[2],10);
         var i2=(parseInt(x[1],10)*100)+(i1*10000);
          var i3=parseInt(x[0],10)+i2;
         var j1=parseInt(y[2],10);
          var j2=(parseInt(y[1],10)*100)+(j1*10000);
          var j3=parseInt(y[0],10)+j2;
          if(j3<i3)
          {
           alert("cancellation date must be greater than registered date");
          return false;
          }
        }
      }
        
      //function for checking the hostel  cancellation date and registered date
      
      function hostelregcan()
      {
      var reg=document.getElementById("accregdate").value;
      var cal=document.getElementById("acccdate").value;
      if((reg.length!=10)||(cal.length!=10))
       		 {
         	  alert("enter the bus register and cancellation dates correctly");
          	 return false;     
       		 }
       		 else
       		 { 
        		var x=reg.split("/");
        		var y=cal.split("/");
        		var dd1=parseInt(x[0],10);
        		var mm1=parseInt(x[1],10);
        		var dd2=parseInt(y[0],10);
        		var mm2=parseInt(y[1],10);
        if((mm1==1)||(mm1==3)||(mm1==5)||(mm1==7)||(mm1==8)||(mm1==10)||(mm1==12))
        	 {
           		 if(dd1>31)
           		 {
           		  alert("enter the correct the day in the registered date");
             		return false;
            	 }
             	return false;
        	 }
         else
         {
            if(dd2>30)
            {
             alert("enter the correct the day in the cancellation date");
             return false;
             }
         if(mm1>12)
         {
           alert("month must not be greater than 12 in registered date");
           return false;
           }
           if(mm2>12)
           {
           alert("month must not be greater than 12 in cancellation date");
           return false;
           }
           var i1=parseInt(x[2],10);
           var i2=(parseInt(x[1],10)*100)+(i1*10000);
           var i3=parseInt(x[0],10)+i2;
          var j1=parseInt(y[2],10);
          var j2=(parseInt(y[1],10)*100)+(j1*10000);
          var j3=parseInt(y[0],10)+j2;
           if(j3<i3)
           {
               alert("cancellation date must be greater than registered date");
          return false;
          }
          return false;
        }
        return false;
      }  
      }
      // enabling the fileds for inserting qualification details
      
      
   function checkssc()
   {
   
       if(document.getElementById("ssc").checked)
       {
            document.getElementById("sscins").disabled=false;
            document.getElementById("sscmedium").disabled=false;
            document.getElementById("sscdivision").disabled=false;
            document.getElementById("sscpercentage").disabled=false;
            document.getElementById("sscyear").disabled=false;
            return false;
           
       }
       else
       {
            document.getElementById("sscins").disabled=true;
            document.getElementById("sscmedium").disabled=true;
            document.getElementById("sscdivision").disabled=true;
            document.getElementById("sscpercentage").disabled=true;
            document.getElementById("sscyear").disabled=true;
          
           return false;
       }
   }
   function checkinter()
   {
   
       if(document.getElementById("inter").checked)
       {
            document.getElementById("interins").disabled=false;
            document.getElementById("intermedium").disabled=false;
            document.getElementById("interdivision").disabled=false;
            document.getElementById("interpercentage").disabled=false;
            document.getElementById("interyear").disabled=false;
            return false;
       }
       
       else
       {
            document.getElementById("interins").disabled=true;
            document.getElementById("intermedium").disabled=true;
            document.getElementById("interdivision").disabled=true;
            document.getElementById("interpercentage").disabled=true;
            document.getElementById("interyear").disabled=true;
            
          return false;
       }
   }
   function checkdiploma()
   {
   
       if(document.getElementById("diploma").checked)
       {
            document.getElementById("diplomains").disabled=false;
            document.getElementById("diplomamedium").disabled=false;
            document.getElementById("diplomadivision").disabled=false;
            document.getElementById("diplomapercentage").disabled=false;
            document.getElementById("diplomayear").disabled=false;
            return false;
           
       }
       else
       {
            document.getElementById("diplomains").disabled=true;
            document.getElementById("diplomamedium").disabled=true;
            document.getElementById("diplomadivision").disabled=true;
            document.getElementById("diplomapercentage").disabled=true;
            document.getElementById("diplomayear").disabled=true;
           return false;
            
       }
   }
   function checkdegree()
   {
   
       if(document.getElementById("degree").checked)
       {
            document.getElementById("degreeins").disabled=false;
            document.getElementById("degreemedium").disabled=false;
            document.getElementById("degreedivision").disabled=false;
            document.getElementById("degreepercentage").disabled=false;
            document.getElementById("degreeyear").disabled=false;
            
           return false;
       }
       else
       {
            document.getElementById("degreeins").disabled=true;
            document.getElementById("degreemedium").disabled=true;
            document.getElementById("degreedivision").disabled=true;
            document.getElementById("degreepercentage").disabled=true;
            document.getElementById("degreeyear").disabled=true;
          
          return false;
       }
   }
   function checkug()
   {
   
       if(document.getElementById("ug").checked)
       {
            document.getElementById("ugins").disabled=false;
            document.getElementById("ugmedium").disabled=false;
            document.getElementById("ugdivision").disabled=false;
            document.getElementById("ugpercentage").disabled=false;
            document.getElementById("ugyear").disabled=false;
           return false; 
       }
       else
       {
            document.getElementById("ugins").disabled=true;
            document.getElementById("ugmedium").disabled=true;
            document.getElementById("ugdivision").disabled=true;
            document.getElementById("ugpercentage").disabled=true;
            document.getElementById("ugyear").disabled=true;
           return false;
          
       }
   }
   //image upload function
   function showimage()
   {
   alert("hi");
   var path=document.getElementById("path").value;
   alert(path);
   document.getElementById("photo").src=path;
   }