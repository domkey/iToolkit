<editable-link>
    <a href="javascript:void(0);" if={ !editable } onclick={ open }>{ value }</a>
    <super-form if={ editable } action={ action } opts={ formOpts }>
        <input type="text" value={ parent.value } name={ parent.name } class="editable-link-input">
        <input type="submit" value="提交">
        <button onclick={ parent.close }>取消</button>
    </super-form>

    var self = this;
    self.editlink = false;
    var EL = self.root;
    var config = self.opts.opts || self.opts;

    self.on('mount', function() {
        self.action = EL.getAttribute('action');
        self.value = EL.getAttribute('text');
        self.name = EL.getAttribute('name');
        self.update();
    })

    open(e) {
        self.editable = true;
        self.update();
    }

    close(e) {
        self.editable = false;
        self.update();
    }

    self.formOpts = {
        errCallback: function() {
            config.errCallback();
            EL.querySelector('.editable-link-input').value = self.value;
            self.editable = false;
            self.update();
        },
        callback: function(value) {
            config.callback();
            self.value = EL.querySelector('.editable-link-input').value;
            self.editable = false;
            self.update();
        }
    }
</editable-link>