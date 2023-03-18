% 1) Open any model and add the block you want to take a snapshot to it. Do not resize the block. 
% 2) Select the block
% 3) In matlab command line type block_screen_shot(gcb)

function block_screen_shot(block_name)
    model_name = 'temp';
    open_system(new_system(model_name));
    add_block(block_name,model_name + "/ ");
    cor = get_param(gcb,'position');
    set_param(model_name + "/ ",'position',[cor(1),cor(2),(cor(3)-cor(1))*1.5 + cor(1), (cor(4)-cor(2))*1.5 + cor(2)])
    print(['-s',model_name],'-dpng',['block','.png'])
    close_system(model_name,0);
end
