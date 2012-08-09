/*
  Crevasse 0.3.2
  Built by Nick Giancola: https://github.com/patbenatar
  Details and source: https://github.com/patbenatar/crevasse
  Demo: https://patbenatar.github.com/crevasse
*/

// Generated by CoffeeScript 1.3.3
(function() {
  var $, Crevasse,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  $ = jQuery;

  $.fn.extend({
    crevasse: function(options) {
      return $(this).each(function() {
        return new Crevasse($(this), options);
      });
    }
  });

  Crevasse = (function() {

    Crevasse.prototype.settings = {
      previewer: null,
      editorStyle: "default",
      usePreviewerReset: true,
      previewerStyle: "github"
    };

    Crevasse.prototype.editor = null;

    Crevasse.prototype.previewer = null;

    function Crevasse($el, options) {
      if (options == null) {
        options = {};
      }
      this._onEditorChange = __bind(this._onEditorChange, this);

      this.options = $.extend({}, this.settings, options);
      if (!$el.is("textarea")) {
        throw "You must initialize on a textarea";
      }
      if (!this.options.previewer) {
        throw "You must provide a previewer element via options";
      }
      if (typeof this.options.previewer === "string") {
        this.options.previewer = $(this.options.previewer);
      }
      this.editor = new Crevasse.Editor($el, this.options);
      this.previewer = new Crevasse.Previewer(this.options.previewer, this.options);
      this.editor.on("change", this._onEditorChange, this);
      if (this.editor.getText() !== "") {
        this._updatePreview();
      }
    }

    Crevasse.prototype._onEditorChange = function() {
      return this._updatePreview();
    };

    Crevasse.prototype._updatePreview = function() {
      return this.previewer.render(this.editor.getText(), this.editor.getCaretPosition());
    };

    return Crevasse;

  })();

  Crevasse.Editor = (function() {

    Editor.prototype.options = null;

    Editor.prototype.$el = null;

    Editor.prototype.text = null;

    function Editor($el, options) {
      this.$el = $el;
      this.options = options;
      this._onPaste = __bind(this._onPaste, this);

      this._onInput = __bind(this._onInput, this);

      _.extend(this, Backbone.Events);
      this.$el.addClass("crevasse_editor");
      this.$el.addClass(this._theme());
      this.$el.bind("" + (this._inputEventName()) + " change", this._onInput);
      this.$el.bind("paste", this._onPaste);
      return this;
    }

    Editor.prototype.getText = function() {
      return this.$el.val();
    };

    Editor.prototype.getCaretPosition = function() {
      return this.$el.caret();
    };

    Editor.prototype._theme = function() {
      switch (this.options.editorStyle) {
        case "default":
          return "default_theme";
        default:
          return this.options.editorStyle;
      }
    };

    Editor.prototype._onInput = function(event) {
      if (this.text === this.getText()) {
        return;
      }
      this.text = this.getText();
      return this.trigger("change");
    };

    Editor.prototype._onPaste = function(event) {
      var _this = this;
      return setTimeout((function() {
        return _this.trigger("change");
      }), 20);
    };

    Editor.prototype._inputEventName = function() {
      if (this._supportsInputEvent()) {
        return "input";
      }
      return "keydown";
    };

    Editor.prototype._supportsInputEvent = function() {
      var el, eventName, isSupported;
      el = document.createElement('textarea');
      eventName = "oninput";
      isSupported = (__indexOf.call(el, eventName) >= 0);
      if (!isSupported) {
        el.setAttribute(eventName, 'return;');
        isSupported = typeof el[eventName] === 'function';
      }
      el = null;
      return isSupported;
    };

    return Editor;

  })();

  Crevasse.Previewer = (function() {

    Previewer.prototype.DIALECT = "Gruber";

    Previewer.prototype.options = null;

    Previewer.prototype.$el = null;

    Previewer.prototype.$previewer = null;

    Previewer.prototype.$offsetDeterminer = null;

    Previewer.prototype.width = null;

    Previewer.prototype.height = null;

    function Previewer($el, options) {
      this.$el = $el;
      this.options = options;
      this._onResize = __bind(this._onResize, this);

      if (this.options.usePreviewerReset) {
        this.$el.addClass("crevasse_reset");
      }
      this._getDimensions();
      this.$previewer = $("<div class='crevasse_previewer'>");
      this.$previewer.addClass(this._theme());
      this.$el.append(this.$previewer);
      this.$offsetDeterminer = this.$previewer.clone();
      this.$offsetDeterminer.css({
        width: this.width,
        height: "auto",
        position: "absolute",
        top: 0,
        left: -10000
      });
      this.$el.append(this.$offsetDeterminer);
      this.$el.bind("crevasse.resize", this._onResize);
      return this;
    }

    Previewer.prototype.render = function(text, caretPosition) {
      var offset;
      if (caretPosition == null) {
        caretPosition = null;
      }
      this.$previewer.html(markdown.toHTML(text, this.DIALECT));
      if (caretPosition != null) {
        offset = this._determineOffset(text.substr(0, caretPosition));
        if (offset < 0) {
          offset = 0;
        }
        try {
          return this.$el.scrollTo(offset, 0);
        } catch (error) {

        }
      }
    };

    Previewer.prototype._theme = function() {
      switch (this.options.previewerStyle) {
        case "github":
          return "github_theme";
        default:
          return this.options.previewerStyle;
      }
    };

    Previewer.prototype._determineOffset = function(text) {
      var textHeight;
      this.$offsetDeterminer.html(markdown.toHTML(text, this.DIALECT));
      textHeight = this.$offsetDeterminer.outerHeight();
      return textHeight - this.height / 2;
    };

    Previewer.prototype._onResize = function(event) {
      this._getDimensions();
      return this._updateOffsetDeterminerDimensions();
    };

    Previewer.prototype._getDimensions = function() {
      this.width = this.$el.width();
      return this.height = this.$el.height();
    };

    Previewer.prototype._updateOffsetDeterminerDimensions = function() {
      return this.$offsetDeterminer.width(this.width);
    };

    return Previewer;

  })();

}).call(this);
