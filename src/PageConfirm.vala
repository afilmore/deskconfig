/***********************************************************************************************************************
 * PageConfirm.vala
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

public class PageConfirm : PageBase {
    
    public PageConfirm () {
        
        _type = Gtk.AssistantPageType.CONFIRM;
        _title = "Confirmation";
        _complete = true;
        
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        _box.pack_start (new Gtk.Label ("Text has been entered\n"), false, false, 5);
        
    }

}
