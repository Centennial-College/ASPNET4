﻿<%@ Page Language="C#" MasterPageFile="~/Dorknozzle.master" AutoEventWireup="true" CodeFile="AddressBook.aspx.cs" Inherits="AddressBook" Title="Dorknozzle Address Book" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <h1>Address Book</h1>
  <asp:GridView id="grid" runat="server" />
</asp:Content>

