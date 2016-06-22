<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div class="navbar navbar-default center-side" style="border-radius: 0px;background:white">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> <i class="fa fa-bank"></i>
            <a class="navbar-brand">KK Bank</a>
        </div>

        <ul class="nav navbar-nav">
            <li class="active">
                <a href="userIndex">Home</a>
            </li>
	        <!-- s:if test="userIndex" -->
	        	<li class="dropdown">
					<a href="toAccountEnquiry">Banking</a>	        
	            </li>
	        
            <li class="dropdown">
                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                    Help
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="javascript:void(0)">
                            <span class="glyphicon glyphicon-info-sign"></span>
                            About
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <span class="glyphicon glyphicon-phone-alt"></span>
                            Contact us
                        </a>
                    </li>
                </ul>
            </li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <s:if test="#session.loginID==null">
                <li>
                    <a href="user/userLogin">Log in</a>
                </li>
                <li>
                    <a href="user/register">Sign in</a>
                </li>
            </s:if>
            <s:else>
                <li>
                    <a> <i class="fa fa-user"></i>
                        <span>Hello,${name }</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:void(0)" id="logout">
                        <i class="fa fa-sign-out"></i>
                        <span>Log out</span>
                    </a>
                </li>
            </s:else>
        </ul>
    </div>
</div>
