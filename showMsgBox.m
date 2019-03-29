function []=showMsgBox(message, title, icon)
    mbox = msgbox(message, title, icon);
    object_handles = findall(mbox);
    set( object_handles(6), 'FontSize', 12)