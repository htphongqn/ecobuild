﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master/Site.Master" AutoEventWireup="true" CodeBehind="news_list.aspx.cs" Inherits="yeuthietkeweb.cms.pages.news_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<!-- DataTables CSS -->
    <link href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">
    <style>
        #tblFilter td
        {
            padding:5px;
        }
    </style><script language="javascript">
				<!--
                function ToggleAll(e, action) {
                    if (e.checked) {
                        CheckAll();
                    }
                    else {
                        ClearAll();
                    }
                }

                function CheckAll() {
                    var ml = document.forms[0];
                    var len = ml.elements.length;
                    for (var i = 1; i < len; i++) {
                        var e = ml.elements[i];

                        if (e.name.toString().indexOf("chkSelect") > 0)
                            e.checked = true;
                    }
                    ml.MainContent_GridItemList_toggleSelect.checked = true;
                }

                function ClearAll() {
                    var ml = document.forms[0];
                    var len = ml.elements.length;
                    for (var i = 1; i < len; i++) {
                        var e = ml.elements[i];
                        if (e.name.toString().indexOf("chkSelect") > 0)
                            e.checked = false;
                    }
                    ml.MainContent_GridItemList_toggleSelect.checked = false;
                }

                function selectChange() {
                    var radioButtons = document.getElementsByName("rblType");
                    for (var x = 0; x < radioButtons.length; x++) {
                        if (radioButtons[x].checked) {
                            if (radioButtons[x].value == 1)
                            { CheckAll(); }
                        }
                    }

                }
				    
				// -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Danh sách bài viết</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Danh sách bài viết
                </div>
                <div class="panel-body">
                    <div class="dataTable_wrapper">
                        <div class="form-group">
                            <table id="tblFilter">
                                <tr>
                                    <td>
                                        <a href="news.aspx" class="btn btn-default btn-success btn-sm">Thêm mới</a>
                                        <asp:LinkButton ID="lbtDelete" runat="server" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');" CssClass="btn btn-default btn-success btn-sm"
                                            CausesValidation="false" OnClick="lbtDelete_Click">Xóa</asp:LinkButton>
                                    </td>
                                    <td>
                                        
                                    </td>
                                </tr>
                                <tr>                                
                                    <td>
                                        <%--<div id="click">
                                            <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click">Tìm kiếm </asp:LinkButton>
                                        </div>--%>
                                        <asp:DropDownList ID="Ddnguon" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="Change_nguon">
                                            <asp:ListItem Value="-1">---- Chọn loại tin----</asp:ListItem>
                                            <asp:ListItem Text="Tin tức" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Dịch vụ" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="Global contact" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Intro" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>                                        
                                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" CssClass="form-control" OnSelectedIndexChanged="Drchuyenmuc_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th class="center">STT</th>
                                    <th class="center">
                                        <input type="checkbox" id="toggleSelect" runat="server" onclick="javascript: ToggleAll(this,0);"
                                            name="toggleSign">
                                    </th>
                                    <th>Tiêu đề</th>
                                    <th>Trạng thái</th>
                                    <th>Thứ tự</th>
                                    <th>Ngày tạo</th>
                                    <th class="center">Sửa</th>
                                    <th class="center">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>                                
                                <asp:Repeater ID="rptList" runat="server" OnItemCommand="rptList_ItemCommand">
                                    <ItemTemplate>
                                        <tr class="odd gradeX">
                                            <td class="center">
                                                <%# getOrder()%>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("NEWS_ID")%>' Visible="false"></asp:Label>
                                            </td>
                                            <td class="center">
                                                <input id="chkSelect" type="checkbox" name="chkSelect" runat="server" style="border-top-style: none;
                                                    border-right-style: none; border-left-style: none; border-bottom-style: none">
                                            </td>
                                            <td>
                                                <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "NEWS_ID")) %>'>
                                                    <%# DataBinder.Eval(Container.DataItem, "NEWS_TITLE")%>
                                                </a>
                                            </td>
                                            <td>
                                                <%# getStatus(DataBinder.Eval(Container.DataItem, "NEWS_SHOWTYPE")) %>
                                            </td>
                                            <td class="center">
                                                <%# DataBinder.Eval(Container.DataItem, "NEWS_ORDER") %>
                                            </td>
                                            <td class="center">
                                                <%# getDate(DataBinder.Eval(Container.DataItem, "NEWS_PUBLISHDATE"))%>
                                            </td>
                                            <td class="center">
                                                <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "NEWS_ID")) %>'><span class="glyphicon glyphicon-pencil"></span></a>
                                            </td>
                                            <td class="center">
                                                <asp:LinkButton ID="lnkbtnDel" runat="server" CommandName="Delete" OnClientClick="return confirm('Bạn có chắc chắn xóa?');">
                                                    <img src="../images/icon_delete.png" title="Xóa" border="0">
                                                </asp:LinkButton>
                                            </td>
                                        </tr>    
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
<!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
     <script>
         $(document).ready(function () {
             $('#dataTables-example').DataTable({
                 responsive: true,
                 aoColumnDefs: [
                  {
                      bSortable: false,
                      aTargets: [1]
                  },
                  {
                      bSortable: false,
                      aTargets: [6]
                  },
                  {
                      bSortable: false,
                      aTargets: [7]
                  }
                ]
             });
         });
    </script>
</asp:Content>