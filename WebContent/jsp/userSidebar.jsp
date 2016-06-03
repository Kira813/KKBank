<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="font-family:Microsoft YaHei">
        <ul class="sidebar-menu">
            <li data-tag="index">
                <a href="userIndex.action">
                    <i class="fa fa-dashboard"></i><span>Index</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="toAccountEnquiry.action">
                    <i class="fa fa-user"></i><span>Account Enquiry</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="toTransfer.action">
                    <i class="fa fa-user"></i><span>Transfer</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>