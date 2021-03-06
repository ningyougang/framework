<#assign base = request.contextPath/>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head> 
<title><@spring.message "sys.datagrid.html.title"/></title>
<!--EasyUI css Start-->
<link href="${base}/resources/global/plugins/easyui/themes/metro/panel.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/global/plugins/easyui/themes/metro/linkbutton.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/global/plugins/easyui/themes/metro/datagrid.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/global/plugins/easyui/themes/metro/window.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/global/plugins/easyui/themes/metro/pagination.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/global/plugins/easyui/themes/metro/combo.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/global/plugins/easyui/themes/metro/combobox.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/global/plugins/easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
<link href="${base}/resources/global/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/global/plugins/bootstrap-toastr/toastr.css" rel="stylesheet" type="text/css">
<!--lion UI css Start-->
<link href="${base}/resources/global/css/lion.css" rel="stylesheet" type="text/css">
<link href="${base}/resources/global/css/dialog/lion.dialog.css" rel="stylesheet" type="text/css">
<link href="${base}/resources/global/css/combo/lion.combo.css" rel="stylesheet" type="text/css">
<!--lion UI css End-->
<script src="${base}/resources/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${base}/resources/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript" ></script>
<script src="${base}/resources/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<!--EasyUI JavaScript Start-->
<script src="${base}/resources/global/plugins/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${base}/resources/global/plugins/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<!--EasyUI JavaScript End-->
<!--lion UI JS Start-->
<script src="${base}/resources/global/js/lion.js" type="text/javascript"></script>
<script src="${base}/resources/global/js/form/form.fill.js" type="text/javascript"></script>
<script src="${base}/resources/global/js/dialog/dialog.js" type="text/javascript"></script>
<script src="${base}/resources/global/js/combo/combo.js" type="text/javascript"></script>
<!--lion UI JS End-->
<script src="${base}/resources/global/js/local/lion-lang-zh_CN.js" type="text/javascript"></script>
<script src="${base}/resources/admin/scripts/system/datagrid.js" type="text/javascript"></script>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">
<!-- BEGIN PAGE CONTENT INNER -->
<div class="portlet light">
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12 margin-bottom-10">
				<form id="queryform" class="form-horizontal">
					<label class="control-label col-md-1" for="tableId" ><@spring.message "sys.datagrid.query.tableid.text"/></label>
					<div class="col-md-2">
						<input class="form-control input-small" type="text" size="30" name="tableId"  placeholder="<@spring.message "sys.datagrid.query.tableid.missing.message"/>"/>					
					</div>
					<label class="control-label col-md-2" for="type" ><@spring.message "sys.datagrid.query.title.text"/></label>
					<div class="col-md-2">
						<input class="form-control input-small" type="text" size="30" name="title"  placeholder="<@spring.message "sys.datagrid.query.title.missing.message"/>"/>					
					</div>
					<label class="control-label col-md-1" for="type" ><@spring.message "sys.datagrid.query.type.text"/></label>
					<div class="col-md-2">
						<select  id="queryType"  name="type" data-size="8" 
						 	data-maxoptions="1"   multiple placeholder="<@spring.message "sys.datagrid.query.type.missing.message"/>..."  
						 	class="lion-combo bootstrap-select form-control" data-valueField='codeValue'   value=""
						 	data-textField='nameZh' data-loadURL="${base}/system/code/combox.json?nameEn=datagrid_type">
						 </select>
					</div>
					<div class="col-md-2">
						<a href="javascript:void(0)" id="btnQuery" class="btn blue"><i class="fa fa-search"></i> <@spring.message "common.query.btn.text"/> </a>
					</div>
				</form>
			</div>
		
			<div class="col-md-12 margin-bottom-10" id="toolbar">
				<a id="btnAdd" class="btn btn-sm yellow" data-toggle="modal" href="#basic"><i class="fa fa-plus"></i> <@spring.message "common.toolbar.btn.add.text"/>  </a>
				<a id="btnEdit" class="btn btn-sm red"><i class="fa fa-edit"></i> <@spring.message "common.toolbar.btn.edit.text"/></a>
				<a href="javascript:void(0)" id="btnDelete" class="btn btn-sm purple"><i class="fa fa-times"></i> <@spring.message "common.toolbar.btn.delete.text"/> </a>
				<a href="javascript:void(0)" id="btnRefresh" class="btn btn-sm blue"><i class="fa fa-refresh"></i> <@spring.message "common.toolbar.btn.reload.text"/>   </a>
				<a href="javascript:void(0)" id="btnExport"  class="btn btn-sm green"><i class="fa  fa-file-excel-o"></i> <@spring.message "common.toolbar.btn.export.text"/> </a>
			</div>
			<div class="col-md-12">
				 <@lion.datagrids name="datagrid_dt" tableClass="easyui-datagrid" toolbar=""  load="true" url="${base}/system/datagrid/list.htm" dataOptions="" style="height:400px;"/>	
			</div>
		</div>
	</div>
</div>
<!-- END PAGE CONTENT INNER -->
<!--Dialog Start -->
<div class="modal fade bs-modal-lg " id="basic" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content ">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title"><i class="fa fa-plus"></i> <span><@spring.message "sys.datagrid.form.adddialog.text"/></span></h4>
			</div>
			<div class="modal-body">
				 	<div class="row">
					 	<div class="col-md-12 portlet-body form">
					 		<!-- BEGIN FORM-->
									<form action="#" class="form-horizontal" name="sysDataGridForm" id="sysDataGridForm" method="post">
										<input type="hidden" id='id' name='id' value="">
										<div class="form-body">
											<div class="form-group">
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.type.text"/></label>
												<div class="col-md-2">
													<select  id="CodeList"  name="type" data-size="8" 
													 	data-maxoptions="1"   multiple placeholder="<@spring.message "sys.datagrid.form.type.missing.message"/>..."  
													 	class="lion-combo bootstrap-select form-control" data-valueField='codeValue'   value=""
													 	data-textField='nameZh' data-loadURL="${base}/system/code/combox.json?nameEn=datagrid_type">
													 </select>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.tableId.text"/></label>
												<div class="col-md-2">
													<div class="input-group">
														<input   type="text"  id="tableId" name="tableId" maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.tableId.missing.message"/>" size="30"/>
													</div>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.title.text"/></label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input   type="text"  id="title" name="title" maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.title.missing.message"/>" size="30"/>
													</div>
												</div>
												<div class="col-md-3">
													<@spring.message "sys.datagrid.form.showTitle.text"/>
													<input type="checkbox" class="form-control "  name="showTitle" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.url.text"/></label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input   type="text"  id="url" name="url" maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.url.missing.message"/>" size="30"/>
													</div>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.data.text"/></label>
												<div class="col-md-2">
													<div class="input-group">
														<input   type="text"  id="data" name="data" maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.data.missing.message"/>" size="30"/>
													</div>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.loadMsg.text"/></label>
												<div class="col-md-2">
													<div class="input-group">
														<input type="text"  name="loadMsg"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.loadMsg.missing.message"/>" size="30"/>
													</div>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.method.text"/></label>
												<div class="col-md-2">
													<input type="radio" name="method" id="method0" value="get" >
													get
													<input type="radio" name="method" id="method1" value="post" checked>
													post
												</div>
											</div>		
											<div class="form-group">
												<label class="col-md-2 control-label"><@spring.message "sys.datagrid.form.pagePosition.text"/></label>
												<div class="col-md-2">
													<select  id="pagePosition"  name="pagePosition" data-size="8" 
													 	data-maxoptions="1"   multiple placeholder="<@spring.message "sys.datagrid.form.pagePosition.missing.message"/>..."  
													 	class="lion-combo bootstrap-select form-control" data-valueField='codeValue'   value=""
													 	data-textField='nameZh' data-loadURL="${base}/system/code/combox.json?nameEn=PagePosition">
													 </select>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.pageList.text"/></label>
												<div class="col-md-2">
													<select  id="pageList"  name="pageList" data-size="8" 
													 	data-maxoptions="1"   multiple placeholder="<@spring.message "sys.datagrid.form.pageList.missing.message"/>..."  
													 	class="lion-combo bootstrap-select form-control" data-valueField='codeValue'   value=""
													 	data-textField='nameZh' data-loadURL="${base}/system/code/combox.json?nameEn=PageList">
													 </select>	
												</div>
												<label class="col-md-2 control-label"><@spring.message "sys.datagrid.form.pageNumber.text"/></label>
												<div class="col-md-1">
													<div class="input-group radio-list">	
														<input type="text"  name="pageNumber"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.pageNumber.missing.message"/>" size="30" value="1"/>
													</div>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.pageSize.text"/></label>
												<div class="col-md-1">
													<div class="input-group radio-list">	
														<input type="text"  name="pageSize"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.pageSize.missing.message"/>" size="30" value="15"/>
													</div>
												</div>
											</div>	
											<div class="form-group">
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.queryParams.text"/></label>
												<div class="col-md-2">
													<div class="input-group">
														<input type="text"  name="queryParams"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.queryParams.missing.message"/>" size="30"/>
													</div>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.sortName.text"/></label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input type="text"  name="sortName"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.sortName.missing.message"/>" size="30"/>
													</div>
												</div>
												<div class="col-md-2 control-label">
													<@spring.message "sys.datagrid.form.remoteSort.text"/>
													<input type="checkbox" class="form-control "  name="remoteSort" />
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.sortOrder.text"/></label>
												<div class="col-md-3">
													<div class="input-group radio-list">	
														<label class="radio-inline">
															<input type="radio" name="sortOrder" id="sortOrder0" value="asc" checked>
															asc
														</label>
														<label class="radio-inline">
															<input type="radio" name="sortOrder" id="sortOrder1" value="desc">
															 desc
													    </label>
													</div>
												</div>
											</div>																					
											<div class="form-group">
												<label class="col-md-2 control-label"><@spring.message "sys.datagrid.form.scrollbarSize.text"/></label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input type="text"  name="scrollbarSize"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.scrollbarSize.missing.message"/>" size="30" value="18"/>
													</div>
												</div>
												<label class="col-md-1 control-label"><@spring.message "sys.datagrid.form.rowStyler.text"/></label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input type="text"  name="rowStyler"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.rowStyler.missing.message"/>" size="30"/>
													</div>
												</div>
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.showHeader.text"/>
													<input type="checkbox" class="form-control "  name="showHeader" />
												</div>
												<div class="col-md-3">
													<@spring.message "sys.datagrid.form.showFooter.text"/>
													<input type="checkbox" class="form-control "  name="showFooter" />
												</div>
											</div>	
											
											<div class="form-group">
												<label class="col-md-1 control-label">
													<@spring.message "sys.datagrid.form.loader.text"/>
												</label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input type="text"  name="loader"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.loader.missing.message"/>" size="30"/>
													</div>
												</div>
												<label class="col-md-1 control-label">
													<@spring.message "sys.datagrid.form.loadFilter.text"/>
												</label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input type="text"  name="loadFilter"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.loadFilter.missing.message"/>" size="30"/>
													</div>
												</div>
												<label class="col-md-1 control-label">
													<@spring.message "sys.datagrid.form.editors.text"/>
												</label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input type="text"  name="editors"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.editors.missing.message"/>" size="30"/>
													</div>
												</div>
												<label class="col-md-1 control-label">
													<@spring.message "sys.datagrid.form.view.text"/>
												</label>
												<div class="col-md-2">
													<div class="input-group radio-list">	
														<input type="text"  name="view222"  maxlength="100" class="form-control" placeholder="<@spring.message "sys.datagrid.form.view.missing.message"/>" size="30"/>
													</div>
												</div>
											</div>	
											
											<div class="form-group">
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.fit.text"/>
													<input type="checkbox" class="form-control "  name="fit" />
												</div>												
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.frozen.text"/>
													<input type="checkbox" class="form-control "  name="frozen" />
												</div>												
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.showGroup.text"/>
													<input type="checkbox" class="form-control "  name="showGroup" />
												</div>												
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.pagination.text"/>
													<input type="checkbox" class="form-control "  name="pagination" />
												</div>												
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.fitColumns.text"/>
													<input type="checkbox" class="form-control "  name="fitColumns" />
												</div>												
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.striped.text"/>
													<input type="checkbox" class="form-control "  name="Striped" />
												</div>	
											</div>	
											<div class="form-group">
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.nowrap.text"/>
													<input type="checkbox" class="form-control "  name="nowrap" />
												</div>
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.rownumbers.text"/>
													<input type="checkbox" class="form-control "  name="rownumbers" />
												</div>
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.singleSelect.text"/>
													<input type="checkbox" class="form-control "  name="singleSelect" />
												</div>
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.checkOnSelect.text"/>
													<input type="checkbox" class="form-control "  name="checkOnSelect" />
												</div>
												<div class="col-md-2">
													<@spring.message "sys.datagrid.form.selectOnCheck.text"/>	
													<input type="checkbox" class="form-control "  name="selectOnCheck" />
												</div>
											</div>															
										</div>								 
									</form>
									<!-- END FORM-->
								</div>
					 	</div>
				 	<div>
			</div>
			<div class="modal-footer">
				<button type="button" id="btnCancel" class="btn default" data-dismiss="modal"><i class="fa  fa-arrow-left"></i> <@spring.message "common.diaglog.btn.cancel"/> </button>
				<button type="button" id="btnSave" class="btn blue"><i class="fa fa-save"></i> <@spring.message "common.diaglog.btn.save"/></button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
</div>
<!--Dialog End -->

</body>
</html>