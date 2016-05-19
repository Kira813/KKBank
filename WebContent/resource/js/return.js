"use strict";
(function() {
    
    var dialog = dialogInit();

    function dialogInit() {
        var dom = {},
            action = 'order/returnOrder.action';

        init();

        function init() {
            inspectStyle();

            var html = render();
            $('body').append(html);

            dom.wrap = $('#dialog_wrap');
            dom.orderId = dom.wrap.find('.dialog-orderId');
            dom.open = $('.dialog-open');
            dom.close = dom.wrap.find('.dialog-close');
            dom.confirm = dom.wrap.find('.dialog-confirm');
            dom.textarea = dom.wrap.find('textarea');
            dom.orderInput = dom.wrap.find('.orderId');
            dom.userInput = dom.wrap.find('.userId');
            dom.form = dom.wrap.find('.dialog-form');

            bindEvent();
        }

        function render() {
            var str =   '<div id="dialog_wrap" class="dialog-wrap">' +
                            '<div class="box box-solid box-primary">' +
                                '<div class="box-header">' +
                                    '<h3 class="box-title">提示</h3>' +
                                    '<div class="box-tools pull-right">' +
                                        '<button class="btn btn-primary btn-sm dialog-close" data-widget="remove"><i class="fa fa-times"></i></button>' +
                                    '</div>' +
                                '</div>' +
                                '<form action="' + action + '" class="dialog-form" method="post">' +
                                    '<div class="box-body" style="display: block;">' +
                                        '<p class="dialog-msg">确定对订单 <span class="dialog-orderId"></span>进行退货处理？ </p>' +
                                        '<div class="form-group"><textarea class="form-control" rows="3" name="returnsReason" placeholder="请输入退货理由"></textarea></div>' +
                                        '<input type="text" value="" name="orderId" class="orderId" style="display:none" />' +
                                        '<input type="text" value="" name="userId" class="userId" style="display:none" />' +
                                    '</div>' +
                                    '<div class="box-footer" style="display: block;">' +
                                        '<div style="text-align:center"><button class="btn btn-primary dialog-confirm" type="submit" style="margin-right:100px;">确定</button><button class="btn btn-default dialog-close" type="button">取消</button></div>' +
                                    '</div>' +
                                '</form>' +
                            '</div>' +
                        '</div>';
            return str;
        }

        function inspectStyle() {
            var style = '.dialog-wrap{position:fixed;top:0;left:0;right:0;bottom:0;height:100%;width:100%;background:rgba(0,0,0,.7);display:none} .dialog-wrap>div{position:absolute;top:30%;left:50%;margin-left:-159px;width:317px;}';

            var tag = document.createElement('style');
            tag.innerHTML = style;

            $('head').append(tag);
        }

        function bindEvent() {
            dom.open.on('click', function() {
                var oid = $(this).attr('data-oid');
                var uid = $(this).attr('data-uid');
                show(oid, uid);
            });

            dom.close.on('click', function() {
                close();
            });

            dom.form.submit(function(e) {
                e = e || window.event;
                if(!dom.textarea.val()) {
                    dom.textarea.parent('div').addClass('has-error');
                    setTimeout(function() {
                        dom.textarea.parent('div').removeClass('has-error');
                    }, 2000);
                    e.preventDefault();
                    return false;
                }
            });
        }

        function show(oid,uid) {
            dom.orderInput.val(oid);
            dom.userInput.val(uid);
            dom.orderId.text(oid);
            dom.wrap.fadeIn(100);
        }

        function close() {
            dom.wrap.fadeOut(100);
        }

    }
})();