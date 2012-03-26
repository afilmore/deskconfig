/***********************************************************************************************************************
 * PageBrowser.vala
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

public class PageMode : PageBase {
    
    public PageMode () {
        
        _type = Gtk.AssistantPageType.CONTENT;
        _title = "Default";
        _complete = true;
        
        _box = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
        
        CommandRadioButton chk1 = new CommandRadioButton ();
        chk1.label = "Default Setup";
        chk1.set_command_line ("");
        _box.pack_start (chk1, false, false, 5);
        
        CommandRadioButton chk2 = new CommandRadioButton ();
        chk2.label = "Custom Setup";
        chk2.toggled.connect ( () => {
            app.on_custom_mode (chk2.get_active ());
        });
        chk2.set_command_line ("");
        chk2.set_group (chk1.get_group ());
        _box.pack_start (chk2, false, false, 5);

        CommandRadioButton chk3 = new CommandRadioButton ();
        chk3.label = "Expert";
        chk3.set_command_line ("firefox");
        chk3.set_group (chk1.get_group ());
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

