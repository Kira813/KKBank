<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
	<nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid custom-container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">KK Bank</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="userIndex">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Banking<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="toTransfer">Transfer</a></li>
                  <li><a href="#">Time deposit</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Account Enquiry</li>
                  <li><a href="#">Balance Enquiry</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Fund</li>
                  <li><a href="#">Purchase</a></li>
                  <li><a href="#">Redeem</a></li>
                  <li><a href="#">Inquiry</a></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<s:if test="#session.loginID==null">
	              <li><a href="user/userLogin">Log in</a></li>
	              <li><a href="user/register">Sign in</a></li>
	            </s:if>
	            <s:else>
	              <li><a><i class="fa fa-user"></i><span> Hello,${name }</span></a></li>
	              <li><a href="javascript:void(0)" id="logout"><i class="fa fa-sign-out"></i><span> Log out</span></a></li>
	            </s:else>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
