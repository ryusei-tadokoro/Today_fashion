;(function($){
    "use strict";
    $.fn.japanMap = function(options){
        var $this = $(this);
        for(var key in options){
            if(options.hasOwnProperty(key) && options[key] === undefined){
                options[key] = null;
            }
        }
        options = $.extend({
            areas: "prefecture",
            borderColor: "#ccc",
            borderWidth: 0.25,
            areaName: "#777",
            backgroundColor: "#fff",
            hoverColor: "#ccc",
            hoverWidth: 0.5,
            onSelect: function(){},
            onHover: function(){},
            onInit: function(){}
        }, options);

        var map;
        map = new JapanMap(options);
        $this.append(map.element);
        map.draw();
        map.addHover();
        return $this;
    };

    function JapanMap(options){
        this.options = options;
        this.element = document.createElement('canvas');
        this.context = this.element.getContext('2d');
        this.init();
    }

    JapanMap.prototype.init = function(){
        this.setCanvasSize();
        this.drawMap();
        this.addEvents();
        if(this.options.onInit){
            this.options.onInit();
        }
    };

    JapanMap.prototype.setCanvasSize = function(){
        this.element.width = this.options.width || this.defaultWidth;
        this.element.height = this.options.height || this.defaultHeight;
    };

    JapanMap.prototype.drawMap = function(){
        var context = this.context;
        context.clearRect(0, 0, this.element.width, this.element.height);
        context.fillStyle = this.options.backgroundColor;
        context.fillRect(0, 0, this.element.width, this.element.height);
        this.drawPrefectures();
    };

    JapanMap.prototype.drawPrefectures = function(){
        var context = this.context;
        context.strokeStyle = this.options.borderColor;
        context.lineWidth = this.options.borderWidth;
        // Drawing logic for prefectures goes here
    };

    JapanMap.prototype.addEvents = function(){
        var self = this;
        $(this.element).on('mousemove', function(event){
            var x = event.offsetX;
            var y = event.offsetY;
            self.handleHover(x, y);
        });

        $(this.element).on('click', function(event){
            var x = event.offsetX;
            var y = event.offsetY;
            self.handleClick(x, y);
        });
    };

    JapanMap.prototype.handleHover = function(x, y){
        var context = this.context;
        context.clearRect(0, 0, this.element.width, this.element.height);
        this.drawMap();
        // Hover logic
        if(this.options.onHover){
            this.options.onHover(x, y);
        }
    };

    JapanMap.prototype.handleClick = function(x, y){
        // Click logic
        if(this.options.onSelect){
            this.options.onSelect(x, y);
        }
    };

    $.fn.japanMap.defaults = {
        areas: "prefecture",
        borderColor: "#ccc",
        borderWidth: 0.25,
        areaName: "#777",
        backgroundColor: "#fff",
        hoverColor: "#ccc",
        hoverWidth: 0.5,
        onSelect: function(){},
        onHover: function(){},
        onInit: function(){}
    };
})(jQuery);
