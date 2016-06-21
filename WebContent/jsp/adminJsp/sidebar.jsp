<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar" style="font-family:Microsoft YaHei">
        <ul class="sidebar-menu">
            <li data-tag="index">
                <a href="index.action">
                    <i class="fa fa-dashboard"></i><span>Index</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="account/openCard.action">
                    <i class="fa fa-user"></i><span>Opening</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="toChoiceInquiry">
                    <i class="fa fa-user"></i><span>Inquiry</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="account/withdraw.action">
                    <i class="fa fa-user"></i><span>Withdrawal</span>
                </a>
                
            </li>
            <li data-tag="user">
                <a href="admin/deposit.action">
                    <i class="fa fa-user"></i><span>Deposit</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="admin/changePIN.action">
                    <i class="fa fa-user"></i><span>Change Card PIN</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>