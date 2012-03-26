/***********************************************************************************************************************
 * PageIntro.vala
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


public class PageIntro : PageBase {
    
    public PageIntro () {
        
        _type = Gtk.AssistantPageType.INTRO;
        _title = "Introduction";
        _complete = true;
        
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        _box.pack_start (new Gtk.Label ("Follow the configuration steps\n"), false, false, 5);
        
        
    }

}


