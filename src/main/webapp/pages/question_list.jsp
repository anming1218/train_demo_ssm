<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>中国法律援助平台</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="../css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../css/mynews.css" type="text/javascript"></script>
    <script>
        function startTime() {
            const today = new Date();//定义日期对象
            const yyyy = today.getFullYear();//通过日期对象的getFullYear()方法返回年
            let MM = today.getMonth() + 1;//通过日期对象的getMonth()方法返回月
            let dd = today.getDate();//通过日期对象的getDate()方法返回日
            // 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
            MM = checkTime(MM);
            dd = checkTime(dd);
            let day; //用于保存星期（getDay()方法得到星期编号）
            if (today.getDay() === 0) day = "星期日 "
            if (today.getDay() === 1) day = "星期一 "
            if (today.getDay() === 2) day = "星期二 "
            if (today.getDay() === 3) day = "星期三 "
            if (today.getDay() === 4) day = "星期四 "
            if (today.getDay() === 5) day = "星期五 "
            if (today.getDay() === 6) day = "星期六 "
            document.getElementById('nowDateTimeSpan').innerHTML = yyyy + "-" + MM + "-" + dd + " " + day;
            setTimeout('startTime()', 1000);//每一秒中重新加载startTime()方法
        }

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }

        //访问jsp页面时发送请求
        $(function windowsStart() {
            findAmount();
            allQuestion(1, 8);
        });

        //查询所有状态的法律援助,编号为1
        function allQuestion(pages, size) {
            $.get("../question/findAllQuestion?pages=" + pages + "&size=" + size, {}, function (data) {
                //发送ajax请求，加载所有获奖数据
                let count = 1;
                //1.获取table
                const questionList = $("#questionList");
                questionList.html("");
                let table = "<table class=\"table table-bordered table-hover\" style=\"text-align: center\" >\n" +
                    "                    <tr class=\"success\">\n" +
                    "                        <th class=\"text-center\">编号</th>\n" +
                    "                        <th class=\"text-center\">类型</th>\n" +
                    "                        <th class=\"text-center\">标题</th>\n" +
                    "                        <th class=\"text-center\">姓名</th>\n" +
                    "                        <th class=\"text-center\">状态</th>\n" +
                    "                    </tr>";

                ulAppend(data, "1");

                $(data.list).each(function () {
                    //3.创建tr
                    table += "<tr class=\"text-center\">\n" +
                        "                            <td>" + count + "</td>\n" +
                        "                            <td>" + this.type + "</td>\n" +
                        "                            <td>" + "<a style=\"color: #0f0f0f\" href=\"${pageContext.request.contextPath}/question/readQuestion/" + this.id + "\">" + this.pname + "</a></td>\n" +
                        "                            <td>" + this.uname + "</td>\n";

                    if (this.statu === 0) {
                        table += "<td>" + "<a class=\"btn btn-danger btn-sm\" href=\"javascript:void(0);\">审核中</a>" + "</td>\n" +
                            "                        </tr>";

                    } else if (this.statu === 1) {
                        table += "<td>" + "<a class=\"btn btn-warning btn-sm\" href=\"javascript:void(0);\">已审核</a>" + "</td>\n" +
                            "                        </tr>";
                    } else if (this.statu === 2) {
                        table += "<td>" + "<a class=\"btn btn-success btn-sm\" href=\"javascript:void(0);\">已解答</a>" + "</td>\n" +
                            "                        </tr>";
                    }
                    count++;
                });
                questionList.append(table);
                questionList.append("</table>");
            });
        }

        //查询不同状态中的法律援助,编号为2
        function findKindsQuestion(statu, pages, size) {
            $.ajax({
                type: "GET",
                url: "../question/findKindsQuestion?statu=" + statu + "&pages=" + pages + "&size=" + size,
                dataType: "json",
                success: function (data) {
                    //1.获取table
                    let count = 1;
                    const questionList = $("#questionList");
                    questionList.html("")

                    const pageInfo = $("#pageInfo");


                    let ul = "";
                    if (data.pageNum === 1) {
                        ul += "<li class=\"disabled\">"
                    }
                    if (data.pageNum !== 1) {
                        ul += "<li>"
                    }
                    ul += "<a onclick=\"findKindsQuestion(" + statu + "," + (data.pageNum - 1) + "," + ((data.pageSize)) + ")\" aria-label=\"Previous\">\n" +
                        "                    <span aria-hidden=\"true\">&laquo;</span>\n" +
                        "                </a>\n" +
                        "            </li>"

                    for (let i = 1; i <= data.pages; i++) {
                        if (i === data.pageNum) {
                            ul += "<li class=\"active\"><a\n" +
                                "   onclick=\"findKindsQuestion(" + statu + "," + i + "," + ((data.pageSize)) + ")\"    >" + i + "</a>\n" +
                                "                                </li>"
                        }
                        if (i !== data.pageNum) {
                            ul += "<li>\n" +
                                "                                    <a onclick=\"findKindsQuestion(" + statu + "," + i + "," + ((data.pageSize)) + ")\">" + i + "</a>\n" +
                                "                                </li>"
                        }
                    }

                    if (data.pageNum === data.pages) {
                        ul += "<li class=\"disabled\">\n" +
                            "                            <a onclick=\"findKindsQuestion(" + statu + "," + data.pageNum + "," + ((data.pageSize)) + ")\"\n" +
                            "                               aria-label=\"Next\">"
                    }

                    if (data.pageNum !== data.pages) {
                        ul += "                        <li>\n" +
                            "                            <a onclick=\"findKindsQuestion(" + statu + "," + (data.pageNum + 1) + "," + ((data.pageSize)) + ")\"\n" +
                            "                               aria-label=\"Next\">"
                    }

                    ul += "<span aria-hidden=\"true\">&raquo;</span>\n" +
                        "                            </a>\n" +
                        "                        </li>\n" +
                        "                        <span style=\"font-size: 25px;margin-left: 5px;\">\n" +
                        "                    共" + data.total + "条记录，共" + data.pages + "页\n" +
                        "                </span>"
                    pageInfo.html("");
                    pageInfo.append(ul);

                    let table = "<table class=\"table table-bordered table-hover\" style=\"text-align: center\" >\n" +
                        "                    <tr class=\"success\">\n" +
                        "                        <th class=\"text-center\">编号</th>\n" +
                        "                        <th class=\"text-center\">类型</th>\n" +
                        "                        <th class=\"text-center\">标题</th>\n" +
                        "                        <th class=\"text-center\">姓名</th>\n" +
                        "                        <th class=\"text-center\">状态</th>\n" +
                        "                    </tr>";

                    $(data.list).each(function () {

                        //3.创建tr
                        table += "<tr class=\"text-center\">\n" +
                            "                            <td>" + count + "</td>\n" +
                            "                            <td>" + this.type + "</td>\n" +
                            "                            <td>" + "<a style=\"color: #0f0f0f\" href=\"${pageContext.request.contextPath}/question/readQuestion/" + this.id + "\">" + this.pname + "</a></td>\n" +
                            "                            <td>" + this.uname + "</td>\n";

                        if (this.statu === 0) {
                            table += "<td>" + "<a class=\"btn btn-danger btn-sm\" href=\"javascript:void(0);\">审核中</a>" + "</td>\n" +
                                "                        </tr>";
                        } else if (this.statu === 1) {
                            table += "<td>" + "<a class=\"btn btn-warning btn-sm\" href=\"javascript:void(0);\">已审核</a>" + "</td>\n" +
                                "                        </tr>";
                        } else if (this.statu === 2) {
                            table += "<td>" + "<a class=\"btn btn-success btn-sm\" href=\"javascript:void(0);\">已解答</a>" + "</td>\n" +
                                "                        </tr>";
                        }

                        count++;
                    });
                    questionList.append(table);
                    questionList.append("</table>");
                }
            });
        }

        //模糊查询，编号为2
        function selectLikeQuestion(pages, size) {
            $.ajax({
                type: "GET",
                url: "../question/selectLikeQuestion?pages=" + pages + "&size=" + size,
                dataType: "json",
                data: $("#form").serialize(),
                success: function (data) {
                    //1.获取table
                    let count = 1;
                    const questionList = $("#questionList");
                    questionList.html("")


                    ulAppend(data, "2");
                    let table = "<table class=\"table table-bordered table-hover\" style=\"text-align: center\" >\n" +
                        "                    <tr class=\"success\">\n" +
                        "                        <th class=\"text-center\">编号</th>\n" +
                        "                        <th class=\"text-center\">类型</th>\n" +
                        "                        <th class=\"text-center\">标题</th>\n" +
                        "                        <th class=\"text-center\">姓名</th>\n" +
                        "                        <th class=\"text-center\">状态</th>\n" +
                        "                    </tr>";

                    $(data.list).each(function () {

                        //3.创建tr
                        table += "<tr class=\"text-center\">\n" +
                            "                            <td>" + count + "</td>\n" +
                            "                            <td>" + this.type + "</td>\n" +
                            "                            <td>" + "<a style=\"color: #0f0f0f\" href=\"${pageContext.request.contextPath}/question/readQuestion/" + this.id + "\">" + this.pname + "</a></td>\n" +
                            "                            <td>" + this.uname + "</td>\n";

                        if (this.statu === 0) {
                            table += "<td>" + "<a class=\"btn btn-danger btn-sm\" href=\"javascript:void(0);\">审核中</a>" + "</td>\n" +
                                "                        </tr>";
                        } else if (this.statu === 1) {
                            table += "<td>" + "<a class=\"btn btn-warning btn-sm\" href=\"javascript:void(0);\">已审核</a>" + "</td>\n" +
                                "                        </tr>";
                        } else if (this.statu === 2) {
                            table += "<td>" + "<a class=\"btn btn-success btn-sm\" href=\"javascript:void(0);\">已解答</a>" + "</td>\n" +
                                "                        </tr>";
                        }
                        count++;
                    });
                    questionList.append(table);
                    questionList.append("</table>");
                }
            });
        }

        //分配操作
        function distribution(way, pages, size) {
            if (way === 1) {
                allQuestion(pages, size);
            } else if (way === 2) {
                selectLikeQuestion(pages, size)
            }
            // alert("点击成功");
        }

        // 普通分页操作
        function ulAppend(data, way) {
            const pageInfo = $("#pageInfo");


            let ul = "";
            if (data.pageNum === 1) {
                ul += "<li class=\"disabled\">"
            }
            if (data.pageNum !== 1) {
                ul += "<li>"
            }
            ul += "<a onclick=\"distribution(" + way + "," + (data.pageNum - 1) + "," + ((data.pageSize)) + ")\" aria-label=\"Previous\">\n" +
                "                    <span aria-hidden=\"true\">&laquo;</span>\n" +
                "                </a>\n" +
                "            </li>"

            for (let i = 1; i <= data.pages; i++) {
                if (i === data.pageNum) {
                    ul += "<li class=\"active\"><a\n" +
                        "   onclick=\"distribution(" + way + "," + i + "," + ((data.pageSize)) + ")\"    >" + i + "</a>\n" +
                        "                                </li>"
                }
                if (i !== data.pageNum) {
                    ul += "<li>\n" +
                        "                                    <a onclick=\"distribution(" + way + "," + i + "," + ((data.pageSize)) + ")\">" + i + "</a>\n" +
                        "                                </li>"
                }
            }

            if (data.pageNum === data.pages) {
                ul += "<li class=\"disabled\">\n" +
                    "                            <a onclick=\"distribution(" + way + "," + data.pageNum + "," + ((data.pageSize)) + ")\"\n" +
                    "                               aria-label=\"Next\">"
            }

            if (data.pageNum !== data.pages) {
                ul += "                        <li>\n" +
                    "                            <a onclick=\"distribution(" + way + "," + (data.pageNum + 1) + "," + ((data.pageSize)) + ")\"\n" +
                    "                               aria-label=\"Next\">"
            }

            ul += "<span aria-hidden=\"true\">&raquo;</span>\n" +
                "                            </a>\n" +
                "                        </li>\n" +
                "                        <span style=\"font-size: 25px;margin-left: 5px;\">\n" +
                "                    共" + data.total + "条记录，共" + data.pages + "页\n" +
                "                </span>"
            pageInfo.html("");
            pageInfo.append(ul);
        }

        //查找记录数
        function findAmount() {
            $.ajax({
                type: "GET",
                url: "../question/findAmount",
                dataType: "json",
                success: function (data) {
                    //用ID获取三个位置
                    //全部条数
                    let findAmount = $("#findAmount");
                    findAmount.html("");
                    findAmount.append("<span style=\"font-size: 20px;font-family: 华文楷体\">累计主题：<span\n" +
                        "                                style=\"color: rgb(204,0,24);\" >" + data.allAmount + "</span>条</span>&nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "                            <span style=\"font-size: 20px;font-family: 华文楷体\">已办结：<span\n" +
                        "                                    style=\"color: rgb(204,0,24)\">" + data.processed + "</span>条</span> &nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "                            <span style=\"font-size: 20px;font-family: 华文楷体\">办理中：<span\n" +
                        "                                    style=\"color: rgb(204,0,24)\">" + (data.allAmount - data.processed) + "</span>条</span>&nbsp;&nbsp;&nbsp;&nbsp;")
                }
            })
        }


    </script>

    <style type="text/css">
        .divcolor:hover {
            background-color: rgb(215, 59, 62);

        }

        .divcolor span:hover {
            color: rgb(255, 255, 255);
        }

        .bg {
            background-image: url("http://cdnming.minglovejuan.club/falv/20201005091956.png");
        }
    </style>
</head>
<body onload="startTime()">
<div class="container-fluid bg">
    <div class="container">
        <!-- 页面顶端 -->
        <div class="row">
            <div class="col-md-11 fl sj bg"
                 style="background-color: rgb(245,245,245);color: rgb(36,36,36);height: 30px">
                <a href="../pages/home.html"><span
                        style="font-size: 18px;line-height: 30px;color: #0f0f0f">返回中国法院网</span></a>
            </div>
            <div class="col-md-1 sj bg" style="background-color: rgb(245,245,245);color: rgb(36,36,36);height: 30px">
            <span style="font-size: 18px;line-height: 30px"><a href="../pages/login.jsp"
                                                               style="color: #0f0f0f">登录</a></span>
            </div>
        </div>

        <!-- 页面顶端图片 -->
        <div class="row">
            <div class="col-md-2">
                <a href="../pages/home.html"><img src="http://cdnming.minglovejuan.club/falv/20200930094135.png"
                                                  class="img-responsive" alt="中国法院网"/></a>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-6 bg">
                <img src="http://cdnming.minglovejuan.club/falv/20200930094729.png" class="img-responsive" alt="民法典"/>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <div class="row">
                    <div class="col-md-12">
                        <span style="font-size: 18px;line-height: 50px" id="nowDateTimeSpan"></span>
                    </div>
                    <div class="col-md-12">
                        <span style="font-size: 18px;line-height: 50px">设为首页    |    收藏本页</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- 导航栏 -->
        <div class="row">
            <div class="col-md-1" style="height: 30px">
            </div>
            <div class="col-md-2" style="height: 30px">
                <a href="../pages/home.html"
                   style="color: #0f0f0f;font-size: 18px;line-height: 30px"><span>首页</span></a>
            </div>
            <div class="col-md-2" style="height: 30px">
                <a href="../pages/question_list.jsp"
                   style="color: #0f0f0f;font-size: 18px;line-height: 30px"><span>法律援助</span></a>
            </div>
            <div class="col-md-2" style="height: 30px">
                <a href="${pageContext.request.contextPath}/knowledge/findKnow"
                   style="color: #0f0f0f;font-size: 18px;line-height: 30px"><span>普法知识</span></a>
            </div>
            <div class="col-md-12">
                <hr style=" border:0; border-bottom:7px solid red;"/>
            </div>
        </div>

        <!-- 正文 -->
        <div class="row">
            <div class="panel-footer col-md-12">
                <ul class="list-group">
                    尊敬的网民朋友：<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您通过中国法律援助平台（百姓畅言、部门信箱等）申请专业的法律援助。
                    您的网贴、来信将按照"分级负责，谁主管、谁负责，依法、及时、就地解决问题的原则"受理，
                    并按政府办公室《关于开展市政府网站在线回复的通知》（政办秘〔2005〕136号）、《关于进一步加强政府网站建设和管理的通知》（政办明电〔2013〕56号）、
                    《关于进一步加强政府网站信息内容建设的通知》（政办〔2015〕22号）、《关于进一步规范网上留言办理工作的通知》（政办秘〔2020〕74号
                    ）等文件精神规定，及时呈报、交办、督办、回复。
                </ul>
            </div>
            <div class="panel-footer col-md-12">
                <div class="row">
                    <div class="col-md-2">
                        <b><span style="font-size: 18px">信息类型：</span></b>
                    </div>
                    <div class="col-md-2 text-center divcolor">
                        <a href="question_list.jsp" style="color: black"><span style="font-size: 18px">不限状态</span></a>
                    </div>
                    <div class="col-md-1 text-center  divcolor">
                        <a onclick="findKindsQuestion(0,1,8)" style="color: black"><span
                                style="font-size: 18px">审核中</span></a>
                    </div>
                    <div class="col-md-1 text-center  divcolor">
                        <a onclick="findKindsQuestion(1,1,8)" style="color: black"><span
                                style="font-size: 18px">已审核</span></a>
                    </div>
                    <div class="col-md-1 text-center  divcolor">
                        <a onclick="findKindsQuestion(2,1,8)" style="color: black"><span
                                style="font-size: 18px">已解答</span></a>
                    </div>
                </div>
            </div>

            <div class="panel-footer col-md-12">
                <div class="col-md-2">
                    <img src="http://cdnming.minglovejuan.club/falv/20201004113323.png" class="img-responsive"
                         alt="查询前面">
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-12" id="findAmount">

                        </div>
                        <div class="col-md-12">
                            <br>
                        </div>
                        <div class="col-md-12">
                            <form class="form-inline" id="form">
                                <div class="form-group">
                                    <label for="type">
                                        <select class="form-control" id="type" name="type">
                                            <option value="-1">问题类型</option>
                                            <option value="交通事故">交通事故</option>
                                            <option value="刑事辩护">刑事辩护</option>
                                            <option value="劳动工伤">劳动工伤</option>
                                            <option value="房产纠纷">房产纠纷</option>
                                            <option value="债务债权">债务债权</option>
                                            <option value="合同事务">合同事务</option>
                                            <option value="医疗纠纷">医疗纠纷</option>
                                            <option value="公司经营">公司经营</option>
                                            <option value="知识产权">知识产权</option>
                                            <option value="婚姻家庭">婚姻家庭</option>
                                            <option value="其他">其他</option>
                                        </select>
                                    </label>
                                </div>
                                &nbsp;
                                <div class="form-group">
                                    <label for="statu">
                                        <select class="form-control" id="statu" name="statu">
                                            <option value="-1">处理状态</option>
                                            <option value="0">审核中</option>
                                            <option value="1">已审核</option>
                                            <option value="2">已办结</option>
                                        </select>
                                    </label>
                                </div>
                                &nbsp;
                                <div class="form-group">
                                    <label class="sr-only" for="pname"></label>
                                    <input type="text" class="form-control" id="pname" name="pname"
                                           placeholder="请输入问题详情">
                                </div>
                                &nbsp;
                                <a class="btn btn-success btn-sm" onclick="selectLikeQuestion(1,8)">查看</a>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
            <div class="panel-footer col-md-12">

                <form id="questionList">

                </form>

                <div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination" id="pageInfo">
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>