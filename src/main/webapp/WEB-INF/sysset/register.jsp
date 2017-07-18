<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@include file="/inc/header.jsp" %>
    <meta charset="UTF-8">
    <title>e-Sciences+会议平台-会员管理</title>
    <link href="<%=path%>/res/asset/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=path%>/res/asset/css/bootstrap.css" rel="stylesheet">
    <link href="<%=path%>/res/asset/css/echartsHome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=path%>/res/css/base.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/res/lib/zTree/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" type="text/css" href="<%= path %>/res/css/bootstrap-datetimepicker.min.css">
    <link rel="shortcut icon" href="<%=path%>/static/assets/ico/favicon.ico">
</head>
<body>
<div class="navbar navbar-default navbar-fixed-top" role="navigation" id="head"></div>
<div class="container-fluid" style="padding-top:10px;">
    <div class="row-fluid">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">管理</a></li>
                <li><a href="#">会员及缴费管理</a></li>
            </ol>
        </div>

        <div class="col-md-12">
            <div class="control-group alert alert-warning">
                <div class="controls">
                    <div class="input-append">
                        <input type="text" class="form-control" style="width:160px;" id="condition"
                               placeholder="手机号 / 邮箱 / 姓名" value="${reg.telphone}">
                        <button type="button" class="btn btn-default" id="btn-query">查询</button>
                        <button type="button" class="btn btn-default" id="btn-print">打印胸卡</button>
                        <button type="button" class="btn btn-default" id="btn-import">导入</button>
                        <span style="margin-left:20px;">提示：代表信息更新的 <b style="color:#a94442">红色</b> 字体显示</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered">
                <thead style="background-color:#ccc">
                <tr>
                    <th width="30"><input type="checkbox" class="input-control" id="table-checkbox-header"/></th>
                    <th>编码</th>
                    <th style="width:80px;min-width: 80px;">姓名</th>
                    <th style="width:200px;min-width: 200px;">个人信息</th>
                    <%--<th>电话</th>--%>
                    <%--<th>邮箱</th>--%>
                    <%--<th>注册时间</th>--%>
                    <th>工作信息 / 论文张贴否 / 住宿安排</th>
                    <th style="width:150px;min-width:150px;">邀请函发送状态<br>稿件状态</th>
                    <th>会议费<br>缴费状态</th>
                    <%--<th>会务组备注</th>--%>
                    <%--<th>发票抬头</th>--%>
                    <%--<th>缴费凭据</th>--%>
                    <%--<th>缴费</th>--%>
                    <%--<th>允许登录</th>--%>
                    <th>修改时间</th>
                    <th>确认签到</th>
                    <th>操作<a id="icon-refresh" class="cbtn o-cancel" title="重新加载表格数据"></a></th>
                </tr>
                </thead>
                <tbody id="data-content">

                </tbody>
                <tfoot>
                <tr>
                    <td colspan="11">

                    </td>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
    <div class="row-fluid">

    </div>
</div>

<!-- 新增数据模态窗口 -->
<div class="modal fade" id="modal-add" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog" style="width:70%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" id="btn-closeSort-encode">
                    <span aria-hidden="true">&times;</span><span class="sr-only"></span>
                </button>
                <h4 class="modal-title" id="opt-info">编辑</h4>
            </div>
            <div class="modal-body">
                <form id="form-user" class="form-horizontal" onsubmit="return false;">
                    <input type="hidden" id="id">
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-4">
                                <input type="text" name="nickname" id="nickname" class="form-control" autocomplete="off"  >
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-4">
                                <div class="form-control" style="line-height:20px;border:none">
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="sex1" value="男"  > 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sex" id="sex2" value="女"  > 女
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">职务</label>
                            <div class="col-sm-4">
                                <input type="text" name="job" id="job" class="form-control" autocomplete="off"  >
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">职称</label>
                            <div class="col-sm-4">
                                <select id="title" name="title" class="form-control" >
                                    <option value="">请选择职称</option>
                                    <option value="教授" ${not empty register and register.title eq '教授'?'selected="selected"':''}>教授</option>
                                    <option value="副教授" ${not empty register and register.title eq '副教授'?'selected="selected"':''}>副教授</option>
                                    <option value="讲师" ${not empty register and register.title eq '讲师'?'selected="selected"':''}>讲师</option>
                                    <option value="助理讲师" ${not empty register and register.title eq '助理讲师'?'selected="selected"':''}>助理讲师</option>
                                    <option value="研究员" ${not empty register and register.title eq '研究员'?'selected="selected"':''}>研究员</option>
                                    <option value="副研究员" ${not empty register and register.title eq '副研究员'?'selected="selected"':''}>副研究员</option>
                                    <option value="助理研究员" ${not empty register and register.title eq '助理研究员'?'selected="selected"':''}>助理研究员</option>
                                    <option value="研究实习员" ${not empty register and register.title eq '研究实习员'?'selected="selected"':''}>研究实习员</option>
                                    <option value="教授级高级工程师" ${not empty register and register.title eq '教授级高级工程师'?'selected="selected"':''}>教授级高级工程师</option>
                                    <option value="高级工程师" ${not empty register and register.title eq '高级工程师'?'selected="selected"':''}>高级工程师</option>
                                    <option value="工程师" ${not empty register and register.title eq '工程师'?'selected="selected"':''}>工程师</option>
                                    <option value="助理工程师" ${not empty register and register.title eq '助理工程师'?'selected="selected"':''}>助理工程师</option>
                                    <option value="高级教师" ${not empty register and register.title eq '高级教师'?'selected="selected"':''}>高级教师</option>
                                    <option value="高级农艺师" ${not empty register and register.title eq '高级农艺师'?'selected="selected"':''}>高级农艺师</option>
                                    <option value="农艺师" ${not empty register and register.title eq '农艺师'?'selected="selected"':''}>农艺师</option>
                                    <option value="助理农艺师" ${not empty register and register.title eq '助理农艺师'?'selected="selected"':''}>助理农艺师</option>
                                    <option value="其他" ${not empty register and register.title eq '其他'?'selected="selected"':''}>其他</option>
                                    <option value="其他（研究生等）" ${not empty register and register.title eq '其他（研究生等）'?'selected="selected"':''}>其他（研究生等）</option>

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">单位</label>
                            <div class="col-sm-4">
                                <input type="text" name="company" id="company" value="${register.company}" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">办公电话</label>
                            <div class="col-sm-4">
                                <input type="text" name="officephone" id="officephone" class="form-control" autocomplete="off" value="${register.officephone}"/>
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">手机</label>
                            <div class="col-sm-4">
                                <input type="text" name="telphone" id="telphone" value="${register.telphone}" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''}/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-4">
                                <input type="text" name="email" id="email" class="form-control" autocomplete="off" ${not empty register?'disabled="disabled"':''} value="${register.email}"/>
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">联系地址</label>
                            <div class="col-sm-4">
                                <input type="text" name="address" id="address" value="${register.address}" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">邮编</label>
                            <div class="col-sm-4">
                                <input type="text" name="postcode" id="postcode" value="${register.postcode}" class="form-control" autocomplete="off"/>
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">论文张贴否</label>
                            <div class="col-sm-4">
                                <div class="form-control" style="line-height:20px;border:none">
                                    <label class="radio-inline">
                                        <input type="radio" name="sfztlw" id="sfztlw1" value="是" ${register.sfztlw eq '是'?'checked':''} > 是
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sfztlw" id="sfztlw2" value="否" ${empty register or register.sfztlw eq '否'?'checked':''}  > 否
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">申请会上发言否</label>
                            <div class="col-sm-4">
                                <div class="form-control" style="line-height:20px;border:none">
                                    <label class="radio-inline">
                                        <input type="radio" name="sfsqhyfy" id="sfsqhyfy1" value="是" ${register.sfsqhyfy eq '是'?'checked':''} > 是
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sfsqhyfy" id="sfsqhyfy2" value="否" ${empty register or register.sfsqhyfy eq '否'?'checked':''}  > 否
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">发言题目</label>
                            <div class="col-sm-4">
                                <input type="text" name="fytm" id="fytm" value="${register.fytm}" class="form-control" autocomplete="off" />

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">发言内容摘要（1000字以内）</label>
                            <div class="col-sm-4">
                                <textarea name="fynrzy" id="fynrzy" class="form-control" autocomplete="off" >${register.fynrzy}</textarea>
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">发言人简介（1000字以内）</label>
                            <div class="col-sm-4">
                                <textarea name="fynrzy" id="fyrjj" class="form-control" autocomplete="off" >${register.fyrjj}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">发表论文否</label>
                            <div class="col-sm-4">
                                <div class="form-control" style="line-height:20px;border:none">
                                    <label class="radio-inline">
                                        <input type="radio" name="sffblw" id="sffblw1" value="是" ${register.sffblw eq '是'?'checked':''} > 是
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="sffblw" id="sffblw2" value="否" ${empty register or register.sffblw eq '否'?'checked':''}  > 否
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">投稿期刊</label>
                            <div class="col-sm-4">
                                <select id="journalname" name="journalname" class="form-control" value="${register.journalname}" >
                                    <option value="">请选择投稿期刊</option>
                                    <option value="《食品科学》" ${not empty register and register.journalname eq '《食品科学》'?'selected="selected"':''}>《食品科学》</option>
                                    <option value="《肉类研究》" ${not empty register and register.journalname eq '《肉类研究》'?'selected="selected"':''}>《肉类研究》</option>
                                    <option value="《乳业科学与技术》" ${not empty register and register.journalname eq '《乳业科学与技术》'?'selected="selected"':''}>《乳业科学与技术》</option>
                                    <option value="《Food Science and Human Wellness》" ${not empty register and register.journalname eq '《Food Science and Human Wellness》'?'selected="selected"':''}>《Food Science and Human Wellness》</option>
                                    <option value="《Current Topics in Nutraceutical Research》" ${not empty register and register.journalname eq '《Current Topics in Nutraceutical Research》'?'selected="selected"':''}>《Current Topics in Nutraceutical Research》</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">稿件编号</label>
                            <div class="col-sm-4">
                                <input type="text" name="gjbh" id="gjbh" value="${register.gjbh}" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">论文题目</label>
                            <div class="col-sm-4">
                                <input type="text" name="gjtm" id="gjtm" value="${register.gjtm}" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">住宿要求</label>
                            <div class="col-sm-4">
                                <div class="form-control" style="line-height:20px;border:none">
                                    <label class="radio-inline">
                                        <input type="radio" name="zsyq" id="zsyq1" value="不住宿" ${empty register or register.zsyq eq '不住宿'?'checked':''} > 不住宿
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="zsyq" id="zsyq2" value="标间" ${register.zsyq eq '标间'?'checked':''} > 标间
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="zsyq" id="zsyq3" value="单床合住" ${register.zsyq eq '单床合住'?'checked':''} > 单床合住
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="group">
                            <label class="col-sm-2 control-label">住宿时间</label>
                            <div class="col-sm-4">
                                <table style="width:100%">
                                    <tr>
                                        <td class="date">
                                            <input type="text" name="zskssj" id="zskssj" class="form-control" style="width:130px;" autocomplete="off" readonly="readonly" />
                                        </td>
                                        <td width="20" style="padding:2px 4px">到</td>
                                        <td align="right">
                                            <input type="text" name="zsjssj" id="zsjssj"  class="form-control" style="width:130px;" autocomplete="off" readonly="readonly" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="group">
                            <label for="gjzt" class="col-sm-2 control-label">稿件状态</label>
                            <div class="col-sm-4">
                                <select id="gjzt" name="gjzt">
                                    <option value="收稿">收稿</option>
                                    <option value="初审">初审</option>
                                    <option value="待交稿件处理费">待交稿件处理费</option>
                                    <option value="已交稿件处理费">已交稿件处理费</option>
                                    <option value="送审">送审</option>
                                    <option value="外审">外审</option>
                                    <option value="终审">终审</option>
                                    <option value="终审退修">终审退修</option>
                                    <option value="复审">复审</option>
                                    <option value="复审退修">复审退修</option>
                                    <option value="待发录用通知">待发录用通知</option>
                                    <option value="发录用通知">发录用通知</option>
                                    <option value="登记版面费">登记版面费</option>
                                    <option value="已到款">已到款</option>
                                    <option value="编辑加工">编辑加工</option>
                                    <option value="排版">排版</option>
                                    <option value="校对">校对</option>
                                    <option value="定稿">定稿</option>
                                    <option value="组版">组版</option>
                                </select>
                            </div>
                        </div>
                        <div class="group">
                            <label for="invoice" class="col-sm-2 control-label">会议费</label>
                            <div class="col-sm-4">
                                <%--<select id="invoice" name="invoice">--%>
                                    <%--<option value="1400元">1400元</option>--%>
                                    <%--<option value="2000元">2000元</option>--%>
                                <%--</select>--%>
                                <input type="text" name="invoice" id="invoice" value="${register.invoice}" class="form-control" autocomplete="off" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="group">
                            <label for="zfflag" class="col-sm-2 control-label">缴费状态</label>
                            <div class="col-sm-4">
                                <select id="zfflag" name="zfflag">
                                    <option value=0>未缴纳会议费</option>
                                    <option value=1>已缴纳会议费</option>
                                    <option value=2>收到电子版汇款单</option>
                                    <option value=3>现场缴纳现金</option>
                                </select>
                            </div>
                        </div>
                        <div class="group">
                            <label for="yqhfszt" class="col-sm-2 control-label">电子版邀请函发送状态</label>
                            <div class="col-sm-4">
                                <select id="yqhfszt" name="yqhfszt">
                                    <option value="未发送">未发送</option>
                                    <option value="已发送，请查收电子邮箱">已发送，请查收电子邮箱</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label for="zzyqhfszt" class="col-sm-2 control-label">纸质版邀请函发送状态</label>
                            <div class="col-sm-4">
                                <select id="zzyqhfszt" name="zzyqhfszt">
                                    <option value="未邮寄">未邮寄</option>
                                    <option value="纸质版邀请函已经邮寄">纸质版邀请函已经邮寄</option>
                                    <option value="会议签到现场领取">会议签到现场领取</option>
                                </select>
                            </div>
                        </div>
                        <div class="group">
                            <label for="registertime" class="col-sm-2 control-label">注册时间</label>
                            <div class="col-sm-4">
                                <div class="input-group date" id="input-registertime">
                                    <input class="form-control input-sm" id="registertime" type="text" value=""
                                           name="sampleTime" data-bv-feedbackicons="false">
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <%--&lt;%&ndash;<input type="text" class="form-control" id="registertime" placeholder="建议英文缩写帐号">&ndash;%&gt;--%>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <label class="col-sm-2 control-label">备注</label>
                            <div class="col-sm-4">
                                <textarea name="message" id="message" class="form-control" autocomplete="off" >${register.message}</textarea>
                            </div>
                        </div>
                        <div class="group">
                            <label for="hwzbz" class="col-sm-2 control-label">会务组备注</label>
                            <div class="col-sm-4">
                                <textarea type="text" class="form-control" id="hwzbz" placeholder="会务组备注"></textarea>
                            </div>
                        </div>

                    </div>


                    <%--<div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            &lt;%&ndash;<a type="reset" class="cbtn o-plus" id="btn-user-add" title="新增（清空表单）"></a>&ndash;%&gt;
                            <a type="button" class="cbtn o-ok pull-right" id="btn-commit" title="提交"></a>
                        </div>
                    </div>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal" id="btn-cancle-input">
                    <i class="glyphicon glyphicon-floppy-remove"></i> 取消
                </button>
                <button type="button" class="btn btn-default pull-right" id="btn-commit" data-loading-text="保存中..."
                        autocomplete="off">
                    <i class="glyphicon glyphicon-floppy-disk"></i> 保存
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 导入用form -->
<form id="form-file-upload" style="display:none;">
    <input class="form-control" id="fileupload" name="uploadFile" type="file"/>
</form>

</body>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/interface/RegisterService.js'></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/echartsHome.js"></script>
<script type="text/javascript" src="<%=path%>/res/asset/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path%>/res/js/jquery.maskedinput.js"></script>
<script type="text/javascript" src="<%= path %>/res/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%= path %>/res/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
    (function ($) {
        loadRegisters();
        $('#id').val('');
        // setInterval(function(){
        // 	loadRegisters();
        // },10*1000);

        $('#icon-refresh,#btn-query').click(function (event) {
            loadRegisters();
        });

        $("#input-registertime").datetimepicker({
            minView: 0,//日期时间选择器所能够提供的最精确的时间选择视图。
            format: 'yyyy-mm-dd hh:ii',
            weekStart: 1,//一周从哪一天开始。0（星期日）到6（星期六）
            startView: 2,//日期时间选择器打开之后首先显示的视图。0 or 'hour';1 or 'day' ;2 or 'month';3 or 'year';4 or 'decade'
            forceParse: false,
            language: 'zh-CN',
            autoclose: true
        });
        $('#zskssj').datetimepicker({
            minView: "month", //选择日期后，不会再跳转去选择时分秒
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
            autoclose:true ,//选择日期后自动关闭
            width:'100%',
            startDate:new Date().getMonth()<=7?'2017-08-01':new Date(),
            endDate:'2017-08-31'
        }).on('changeDate',function(e){
            var startTime = e.date;
            $('#zsjssj').datetimepicker('setStartDate',startTime);
        });
        $('#zsjssj').datetimepicker({
            minView: "month", //选择日期后，不会再跳转去选择时分秒
            format: 'yyyy-mm-dd',
            language: 'zh-CN',
            autoclose:true ,//选择日期后自动关闭
            width:'100%',
            startDate:new Date().getMonth()<=7?'2017-08-01':new Date(),
            endDate:'2017-08-31'
        }).on('changeDate',function(e){
            var endTime = e.date;
            $('#zskssj').datetimepicker('setEndDate',endTime);
        });
    })(jQuery);

    //提交按钮
    $('#btn-commit').click(function (event) {
        saveRegister();
        $("#modal-add").modal("hide");
    });
    //更新用户信息
    function saveRegister() {
        var register = {
            id: $('#id').val(),
            gjzt: $('#gjzt').val() ? $('#gjzt').val() : '',
            zfflag: $('#zfflag').val() ? $('#zfflag').val() : '',
            invoice: $('#invoice').val() ? $('#invoice').val() : '',
            yqhfszt: $('#yqhfszt').val() ? $('#yqhfszt').val() : '',
            zzyqhfszt: $('#zzyqhfszt').val() ? $('#zzyqhfszt').val() : '',
            registertime: $('#registertime').val() ? $('#registertime').val() : '',
            hwzbz: $('#hwzbz').val() ? $('#hwzbz').val() : '',


            zsjssj: $('#zsjssj').val() ? $('#zsjssj').val() : '',
            zskssj: $('#zskssj').val() ? $('#zskssj').val() : '',
            nickname: $('#nickname').val() ? $('#nickname').val() : '',
            sex:  $('input[name="sex"]:checked').val()? $('input[name="sex"]:checked').val():'',
            job: $('#job').val() ? $('#job').val() : '',
            title: $('#title').val() ? $('#title').val() : '',
            company: $('#company').val() ? $('#company').val() : '',
            officephone: $('#officephone').val() ? $('#officephone').val() : '',
            telphone: $('#telphone').val() ? $('#telphone').val() : '',
            email: $('#email').val() ? $('#email').val() : '',
            address: $('#address').val() ? $('#address').val() : '',
            postcode: $('#postcode').val() ? $('#postcode').val() : '',
            sfztlw:  $('input[name="sfztlw"]:checked').val()? $('input[name="sfztlw"]:checked').val():'',
            sfsqhyfy:  $('input[name="sfsqhyfy"]:checked').val()? $('input[name="sfsqhyfy"]:checked').val():'',
            fytm: $('#fytm').val() ? $('#fytm').val() : '',
            fynrzy: $('#fynrzy').val() ? $('#fynrzy').val() : '',
            fyrjj: $('#fyrjj').val() ? $('#fyrjj').val() : '',
            sffblw:  $('input[name="sffblw"]:checked').val()? $('input[name="sffblw"]:checked').val():'',
            journalname: $('#journalname').val() ? $('#journalname').val() : '',
            gjbh: $('#gjbh').val() ? $('#gjbh').val() : '',
            gjtm: $('#gjtm').val() ? $('#gjtm').val() : '',
            zsyq:  $('input[name="zsyq"]:checked').val()? $('input[name="zsyq"]:checked').val():'',
        };
        if (register.id) {
            RegisterService.updateRegisterInfo(register, function (msg) {
                if (msg === true) {
                    loadRegisters();
                    alert("修改完成!");
                } else {
                    alert("信息提交错误!");
                }


            });
        } else {
            alert("请点击需要修改的用户!");
        }
    }
    //加载表格所有数据
    function loadRegisters() {
        var condition = $('#condition').val();
        RegisterService.getRegisters(condition, function (data) {
            var tbody = $('#data-content');
            tbody.empty();
            for (var i = 0; i < data.length; i++) {
                var item = data[i];
                if (!item.yqhfszt) item.yqhfszt = '';
                if (!item.zzyqhfszt) item.zzyqhfszt = '';
                if (item.zfflag == 0) {
                    item.zfflag = '未缴纳会议费';
                } else if (item.zfflag == 1) {
                    item.zfflag = '已缴纳会议费';
                } else if (item.zfflag == 2) {
                    item.zfflag = '收到电子版汇款单';
                } else {
                    item.zfflag = '';
                }

                var tr = $('<tr dataId=' + item.id + ' style="'+(item.isupdated==1?'color:#a94442':'')+'">' +
                    '<td width="30"><input class="input-control" type="checkbox" value="" /></td>'
                    + '<td width="60">' + item.id * 1 + '</td>'
                    + '<td width="60">' + item.nickname + '</td>'
//					+'<td>'+item.sex+'</td>'
//					+'<td>'+item.telphone+'</td>'
//					+'<td>'+item.email+'</td>'
                    + '<td>电话：' + item.telphone + ' <br>邮箱：' + item.email + ' <br>性别：' + item.sex + ' <br>注册时间：' + (item.registertime ? item.registertime.substr(0, 16) : '') + '</td>'
//					+'<td>'+(item.registertime?item.registertime.substr(0,16):'')+'</td>'

                    + '<td>单位：' + item.company + ' <br>职称：' + item.title + '<br>论文张贴：'+item.sfztlw
                    + (item.zsyq?('<br>住宿要求：'+item.zsyq+(item.zsyq != '不住宿'?('('+item.zskssj.substr(0, 10)+' -- '+item.zsjssj.substr(0, 10) +')'):'')):'')
                    +'</td>'
                    + '<td width="100">电子版：' + item.yqhfszt + ' <br>纸质版：' + item.zzyqhfszt + '<br>稿件状态：'+(item.gjzt ? item.gjzt : "")+'</td>'
                    + '<td width="100">会议费：' + (item.invoice ? item.invoice : "") + ' <br>缴费状态：' + item.zfflag + '</td>'
//                    + '<td>' + (item.hwzbz ? item.hwzbz : "") + '</td>'
//					+'<td>'+item.fptt+'</td>'
//					+"<td >"+getfiles(item.tid,item.id,item.zfflag)+"</td>"
//					+"<td align='center' width='100' ><label  class='toggle"+(item.zfflag!=0?'':'  toggle-off') +"' title='已缴/未交'><input type='checkbox' onclick='confirmPayment(this,"+item.id*1+")' class='visi-hidden'></label></td>"
//                    + '<td align="center" width="100"><label class="toggle'
//                    + (item.status != 1 ? '' : '  toggle-off')
//                    + '" title="'+(item.status!=1?'有权':'无权')+'"><input type="checkbox" onclick="updateRegisterStatus(this,' + item.id * 1 + ')" class="visi-hidden"></label></td>'
                    + '<td width="120">'+(item.updatetime ? item.updatetime.substr(0, 16) : '')+'</td>'
                    +'<td align="center" width="100"><label class="toggle'
                    +(item.signin==1?'':'  toggle-off')
                    +'" title="'+(item.signin==1?'已签到':'未签到')+'"><input type="checkbox" onclick="updateRegisterSignin(this,'+item.id*1+')" class="visi-hidden"></label></td>'
                    + '<td width="100" style="text-align: center;" title=""><a class="cbtn o-edit" href="javascript:editData(this,' + item.id * 1 + ')" title="修改">&nbsp;&nbsp;</a>&nbsp;<a class="cbtn o-trash" href="javascript:deleteRegister(' + item.id * 1 + ')" title="删除">&nbsp;&nbsp;</a></td>'
                    +'</tr>');
                tbody.append(tr);
            }
            /*$("#data-content tr").bind("click", function () {
             var dataId = $(this).find("td").eq(1).text();
             getRegisterById(dataId);
             });*/
        });
    }
    //加载form表单数据 根据数据id
    function getRegisterById(dataId) {
        RegisterService.getRegisterById(dataId, function (register) {
            $('#id').val(register.id * 1);
            $('#gjzt').val(register.gjzt);
            $('#zfflag').val(register.zfflag);
            $('#invoice').val(register.invoice);
            $('#yqhfszt').val(register.yqhfszt);
            $('#zzyqhfszt').val(register.zzyqhfszt);
            $('#registertime').val(register.registertime ? (register.registertime).format('yyyy-MM-dd hh:mm') : '');
            $('#hwzbz').val(register.huzbz);
            $('#opt-info').text('当前编辑会员姓名：' + register.nickname);

            $('#zskssj').val(register.zskssj);
            $('#zsjssj').val(register.zsjssj);
            $('#nickname').val(register.nickname);
            if(register.sex=="男"){
                $('input[name="sex"]')[0].checked=true;
            }else {
                $('input[name="sex"]')[1].checked=true;
            }
//            $('input[name="sex"]:checked').val()
//            $('#password').val(register.password);
            $('#job').val(register.job);
            $('#title').val(register.title);
            $('#company').val(register.company);
            $('#officephone').val(register.officephone);
            $('#telphone').val(register.telphone);
            $('#email').val(register.email);
            $('#address').val(register.address);
            $('#postcode').val(register.postcode);
            if(register.sfztlw=="是"){
                $('input[name="sfztlw"]')[0].checked=true;
            }else {
                $('input[name="sfztlw"]')[1].checked=true;
            }
            if(register.sfsqhyfy=="是"){
                $('input[name="sfsqhyfy"]')[0].checked=true;
            }else {
                $('input[name="sfsqhyfy"]')[1].checked=true;
            }
            $('#fytm').val(register.fytm);
            $('#fynrzy').val(register.fynrzy);
            $('#fyrjj').val(register.fyrjj);
            if(register.sffblw=="是"){
                $('input[name="sffblw"]')[0].checked=true;
            }else {
                $('input[name="sffblw"]')[1].checked=true;
            }
            $('#journalname').val(register.journalname);
            $('#gjbh').val(register.gjbh);
            $('#gjtm').val(register.gjtm);
            if(register.zsyq=="不住宿"){
                $('input[name="zsyq"]')[0].checked=true;
            }else  if(register.zsyq=="标间"){
                $('input[name="zsyq"]')[1].checked=true;
            }else  if(register.zsyq=="单床合住"){
                $('input[name="zsyq"]')[2].checked=true;
            }

        });
    }
    function editData(e, dataId) {
        $("#modal-add").modal("show");

        getRegisterById(dataId);
    }

    /**
     * 点击上方新增标签时
     */
    $("#btn-add").click(function () {

        $('#id').val('');
        resetForm('#form-user', '');
        $('#input-dept').data('combobox').setValue({id: App.person.dept.id, name: App.person.dept.name});
    });

    function resetForm(fs, ns) {
        $(':input', fs).not(':button, :submit, :reset').not("input[type='hidden']").val('').removeAttr('checked').removeAttr('selected');
    }

    function getfiles(tid, id, zfflag) {
        if (tid) {
            return "<a  style='color:#F00' href='<%=path%>/auth.do?method=download&fileid=" + tid + "'>查看凭据</a>";
        } else {
            return "没有上传";
        }
    }
    //更改支付状态
    function confirmPayment(_self, registerid) {
        var that = $(_self);
        var checked = !that.parent().hasClass('toggle-off');
        if (checked) {
            that.prop('checked', 'checked');
            that.parent().removeClass('toggle');
            that.parent().addClass('toggle toggle-off');
        } else {
            that.removeProp('checked');
            that.parent().removeClass('toggle toggle-off');
            that.parent().addClass('toggle');
        }
        RegisterService.confirmPayment(registerid, checked ? 0 : 1, function (msg) {
//			loadRegisters();
        });
    }

    function updateRegisterStatus(_self, registerid) {
        var that = $(_self);
        var checked = !that.parent().hasClass('toggle-off');
        if (checked) {
            that.prop('checked', 'checked');
            that.parent().removeClass('toggle');
            that.parent().addClass('toggle toggle-off');
        } else {
            that.removeProp('checked');
            that.parent().removeClass('toggle toggle-off');
            that.parent().addClass('toggle');
        }
        RegisterService.updateRegisterStatus(registerid, checked ? 1 : 0, function (msg) {
        });
    }

    //改变会员签到状态
    function updateRegisterSignin(_self,registerid){
        var that = $(_self);
        var checked = !that.parent().hasClass('toggle-off');
        if(checked){
            that.prop('checked','checked');
            that.parent().removeClass('toggle')
            that.parent().addClass('toggle toggle-off');
        } else {
            that.removeProp('checked');
            that.parent().removeClass('toggle toggle-off')
            that.parent().addClass('toggle');
        }
        RegisterService.updateRegisterSignin(registerid,checked?0:1,function(msg){
        });
    }

    function deleteRegister(fileid) {


        RegisterService.deleteRegister(fileid, function (msg) {
            if (msg === true)
                loadRegisters();
        });
    }
    /**
     * 数据全选/全不选
     */
    $('#table-checkbox-header').change(function () {
        $('td > input').prop('checked', this.checked);
    });
    /**
     *打印二维码按钮
     **/
    $("#btn-print").click(function () {
        var ids = [];
        $('td > input:checked').each(function () {
            if ($(this).parent().parent().attr('dataId'))
                ids.push($(this).parent().parent().attr('dataId'));
            else
                $(this).parent().parent().remove();
        });
        if(ids.length==0) {
            alert('请至少选择一条需要打印的信息！');
            return;
        }
        window.ids = ids.join(",");
        openwindow('<%=path%>/report/reportJsp/ewm.jsp?time=' + Math.random() * 10000000000000000, "", 1010, 600);

    });
    // 对Date的扩展，将 Date 转化为指定格式的String
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
    // 例子：
    // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
    // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
    Date.prototype.format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };
    /**
     * window.open打开新页面
     * @param url 转向网页的地址
     * @param name 网页名称，可为空
     * @param iWidth 弹出窗口的宽度
     * @param iHeight 弹出窗口的高度
     */
    function openwindow(url, name, iWidth, iHeight) {
        //window.screen.height获得屏幕的高，
        //window.screen.width获得屏幕的宽
        var iTop = (window.screen.height - 30 - iHeight) / 2; //获得窗口的垂直位置;
        var iLeft = (window.screen.width - 10 - iWidth) / 2; //获得窗口的水平位置;
        window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=yes,resizeable=no,location=no,status=no');
    }


    $('#btn-import').click(function () {
        $('#fileupload').click();
    });
    $('#fileupload').change(function () {
        var fileName = $(this).val();
        var fileType = fileName.substr(fileName.lastIndexOf(".") + 1);
        fileName = fileName.substr(fileName.lastIndexOf("\\") + 1);
        $('#file-name').val(fileName);
        if (fileType && !(fileType.toLowerCase() == "xls" || fileType.toLowerCase() == "xlsx" || fileType.toLowerCase() == "xlsm")) {
            alert("只能选择excel类型！");
//            $('#fileupload').val('');
//            $('#file-name').val('');
            return;
        }
        var file = dwr.util.getValue("fileupload");
        var fileName = $("#fileupload").val();

        RegisterService.importFiles(file, fileName, function (msg) {
//                loadRegisters();//只刷新表格效果不明显 改成下面整个网页刷新
            window.location.reload();
            alert(msg);

        });

    });


</script>
</html>