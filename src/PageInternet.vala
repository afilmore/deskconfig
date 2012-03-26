/***********************************************************************************************************************
 * PageInternet.vala
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

public class PageInternet : PageBase {
    
    
    public PageInternet () {
        
        _type = Gtk.AssistantPageType.CONTENT;
        _title = "Internet";
        _complete = true;
        
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        
        CommandCheckButton chk1 = new CommandCheckButton ();
        chk1.label = " (Default)";
        chk1.set_command_line ("default");
        chk1.set_active (true);
        _box.pack_start (chk1, false, false, 5);
        
//~         CommandCheckButton chk2 = new CommandCheckButton ();
//~         chk2.label = "Google Chrome";
//~         chk2.set_command_line ("google-chrome");
//~         _box.pack_start (chk2, false, false, 5);
//~ 
//~         CommandCheckButton chk3 = new CommandCheckButton ();
//~         chk3.label = "Firefox";
//~         chk3.set_command_line ("firefox");
//~         _box.pack_start (chk3, false, false, 5);
//~         
//~         CommandCheckButton chk4 = new CommandCheckButton ();
//~         chk4.label = "Midori";
//~         chk4.set_command_line ("midori");
//~         _box.pack_start (chk4, false, false, 5);
        
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

