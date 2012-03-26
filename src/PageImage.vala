/***********************************************************************************************************************
 * PageImage.vala
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

public class PageImage : PageBase {
    
    
    public PageImage () {
        
        _type = Gtk.AssistantPageType.CONTENT;
        _title = "Graphics";
        _complete = true;
        
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        
        CommandCheckButton chk1 = new CommandCheckButton ();
        chk1.label = "mtPaint";
        chk1.set_command_line ("mtpaint");
        chk1.set_active (true);
        _box.pack_start (chk1, false, false, 5);
        
        CommandCheckButton chk2 = new CommandCheckButton ();
        chk2.label = "The Gimp";
        chk2.set_command_line ("gimp");
        _box.pack_start (chk2, false, false, 5);
        
        CommandCheckButton chk3 = new CommandCheckButton ();
        chk3.label = "Simple Scan";
        chk3.set_command_line ("simplescan");
        chk3.set_active (true);
        _box.pack_start (chk3, false, false, 5);

    }

    public override string get_command_line () {
        
        string ret = "apt-get -yq install";
        _box.foreach ( (wgt) => {
            CommandCheckButton chk = wgt as CommandCheckButton;

            if (chk.get_active ()) {
                ret += " ";
                ret += chk.get_command_line ();
            }
        });
        
        return ret;
    }

}

