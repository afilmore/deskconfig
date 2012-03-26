/***********************************************************************************************************************
 * PageBase.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * Purpose: 
 * 
 **********************************************************************************************************************/

public class PageBase : Object {
    
    protected Gtk.Assistant _assistant;
    
    //protected int _index = -1;
    
    protected Gtk.AssistantPageType _type;
    protected string _title;
    protected bool _complete;
    
    protected Gtk.Box _box;

    public bool attach_assistant (Gtk.Assistant assistant) {
        
        if (_box == null)
            return false;
        
        _assistant = assistant;
        
        _assistant.append_page (_box);
        
        _assistant.set_page_title (_box, _title);
        
        _assistant.set_page_type (_box, _type);

        _assistant.set_page_complete (_box, _complete);
        
        return true;
    }
    
    public virtual string get_command_line () {return "";}
    
    public Gtk.Widget get_container () {return _box;}
    
}
