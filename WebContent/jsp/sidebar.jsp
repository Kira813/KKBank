<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<aside class="left-side sidebar-offcanvas">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <ul class="sidebar-menu">
            <li data-tag="index">
                <a href="index.action">
                    <i class="fa fa-dashboard"></i><span>index</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="account/openCard.action">
                    <i class="fa fa-user"></i><span>opening</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="admin/inquiry.action">
                    <i class="fa fa-user"></i><span>inquiry</span>
                </a>
            </li>
            <li data-tag="user">
                <a href="account/withdraw.action">
                    <i class="fa fa-user"></i><span>withdrawal</span>
                </a>
                
            </li>
            <li data-tag="user">
                <a href="admin/deposit.action">
                    <i class="fa fa-user"></i><span>deposit</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>