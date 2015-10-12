<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListNews.ascx.cs" Inherits="ecobuild.Usercontrols.ListNews" %>

<div class="bor2">
    <div class="control-top"> 
        <span><asp:Label ID="lbNewsTitle" runat="server" /></span> 
        <a href="/" class="back-to"><i class="fa fa-mail-reply"></i> Back</a> 
        <a href="/" class="bk-home"><i class="fa fa-home"></i></a> 
    </div>
    <div class="testDiv">
    <div class="iblock list-media">
        <asp:Repeater ID="Rplistnews" runat="server">
        <ItemTemplate>
            <article class="media">
                <figure class="photo-media">
                    <a href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL"))%>'>
                        <%# GetImageT(Eval("NEWS_ID"), Eval("NEWS_IMAGE3"))%>
                    </a>
                </figure>
                <div class="text-media">
                    <h2 class="tt-media"> <a><%# Eval("NEWS_TITLE")%></a></h2>
                    <p><%# Eval("NEWS_DESC")%></p>
                </div>
            </article>
        </ItemTemplate>
        </asp:Repeater>
        <p class="pagination clearfix"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></p>
    </div>
    </div>
      
    <div class="control-bottom"> <a href="javascript:history.back()" class="back-to"><i class="fa fa-mail-reply"></i> Back</a>
        <nav class="breadcrumb">
            <ul>
                <li><a href="/">Trang chủ</a></li>
                <li><a href="/san-pham.htm">Tin tức</a></li>
            </ul>
        </nav>
    </div>
</div>