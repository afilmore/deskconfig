/***********************************************************************************************************************
 * DeskConfig.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * Purpose: http://www.linuxquestions.org/linux/articles/Technical/New_GTK_Widgets_GtkAssistant
 *
 * 1 - Intro (show a banner image)
 * 
 * 2    - Setup Mode.
 * 
 * 3    - Browser
 *          Chromium (Default)
 *          Google Chrome
 *          Firefox
 *          Midori
 * 
 * 4    - Mail
 *          Sylpheed
 *          Mozilla Thunderbird
 * 
 * 5    - Internet
 *          Pidgin
 *          Transmission
 * 
 * 6    - Office
 *          Abiword
 *          Gnumeric
 *          LibreOffice
 *          Docviewer
 *          Osmo
 * 
 * 7    - Graphics
 *          mtPaint
 *          The Gimp
 *          Simple Scan
 * 
 * 8    - Sound & Video
 *          Audacious
 *          GNOME Player
 *          xfburn
 * 
 * 9    - Accessories
 * 
 * 10   - Games
 *          Gnect
 * 
 * 11   - Programming
 *          Geany
 *          Build Essential
 *          Vala
 *          Dev Help
 * 
 *      - Additional Drivers.
 * 
 *      - Desktop config (Gnome 2, Mac, PC)
 * 
 * 3 - Expert Mode
 *      
 *      - Add third party PPA
 *      - Developer pack
 *
 *
 * 
 **********************************************************************************************************************/

DeskConfig app;


public class DeskConfig {
    
    private Gtk.Assistant _assistant;
    
    private SList<Job?> _joblist;
    private bool _is_busy = false;
    private bool _done = false;
    
    private PageBrowser _browser;
    
    DeskConfig () {
        _joblist = new SList<Job> ();           
    }
    
    public void on_custom_mode (bool custom) {
        if (custom) {
            stdout.printf ("custom setup\n");
            _browser.get_container ().show_all ();
        } else {
            stdout.printf ("default setup\n");
            _browser.get_container ().hide ();
        }
    }
    
    public bool run () {
        
        /* Create a new assistant widget with no pages. */
        _assistant = new Gtk.Assistant ();
        _assistant.set_title ("Desktop Configuration");
        _assistant.set_position (Gtk.WindowPosition.CENTER);
        _assistant.set_size_request (450, 300);
        _assistant.destroy.connect ( () => { Gtk.main_quit (); } );

        PageIntro intro = new PageIntro ();
        intro.attach_assistant (_assistant);
        
        PageMode mode = new PageMode ();
        mode.attach_assistant (_assistant);
        
        _browser = new PageBrowser ();
        _browser.attach_assistant (_assistant);
        
        PageMail mail = new PageMail ();
        mail.attach_assistant (_assistant);

        PageInternet internet = new PageInternet ();
        internet.attach_assistant (_assistant);

        PageOffice office = new PageOffice ();
        office.attach_assistant (_assistant);

        PageImage image = new PageImage ();
        image.attach_assistant (_assistant);

        PageMultimedia multimedia = new PageMultimedia ();
        multimedia.attach_assistant (_assistant);

        PageAccessories accessories = new PageAccessories ();
        accessories.attach_assistant (_assistant);

        PageGames games = new PageGames ();
        games.attach_assistant (_assistant);

        PageProgramming programming = new PageProgramming ();
        programming.attach_assistant (_assistant);

//~         PagePPA ppa = new PagePPA ();
//~         ppa.attach_assistant (_assistant);
//~ 
//~         PageDesktop desktop = new PageDesktop ();
//~         desktop.attach_assistant (_assistant);
        
        PageConfirm confirm = new PageConfirm ();
        confirm.attach_assistant (_assistant);
        
        PageSummary summary = new PageSummary ();
        summary.attach_assistant (_assistant);
        
        //_assistant.realize ();
        
        _assistant.show_all ();
        
        _browser.get_container ().hide ();

        _assistant.prepare.connect ( (page) => {
            stdout.printf ("prepare current page: %d\n", _assistant.get_current_page ());
        });
        
        _assistant.cancel.connect ( () => {
            
            stdout.printf ("cancel.connect\n");
            
            if (_is_busy == true) /*    we should have a real way to cancel but currently we don't have one. */
                return;
            
            Gtk.main_quit ();
        });
        
        _assistant.close.connect ( () => {
            stdout.printf ("close.connect\n");
            Gtk.main_quit ();
        });
        
        _assistant.apply.connect ( () => { this._on_apply (); });
        
        return true;
    }
    
    private void _on_apply () {
    
        // we should have a real way to cancel but currently we don't have one.
        if (_done == true) {
            Gtk.main_quit ();
            return;
        }
        
        if (_is_busy == true)
            return;
        
        _is_busy = true;
        
        _assistant.commit ();
        
        Job newjob;

        // get command lines........................................................................................




        
        
        newjob = new Job (_browser.get_command_line ());
        _joblist.append (newjob);







        //----------------------------------------------------------------------------------------------------------
        // if there's some jobs, add an update job first in the list.....
        if (_joblist.length () > 0) {
            newjob = new Job ("apt-get update");
            _joblist.prepend (newjob);
        }
    
        bool execute = false;
        
        // executes jobs in the list................................................................................
        if (execute) {            
            int count = 0;
            foreach (Job job in _joblist) {
                
                count++;
                stdout.printf ("exec job %d\n", count);
                
                job.run ();
                
                while (job.is_running () == true) {
                    while (Gtk.events_pending ())
                      Gtk.main_iteration ();
                    Thread.usleep (100000);
                }
                
                stdout.printf ("job %d finished\n", count);
            }
        } else {
            foreach (Job job in _joblist) {
                
                stdout.printf ("exec job %s\n", job.get_command_line ());
                
            }
        }
        
        // executes jobs in the list................................................................................
        
        _is_busy = false;
        _done = true;
        
        //Gtk.main_quit ();
    }
    
    private static int main (string[] args) {
        
        Gtk.init (ref args);
        
        if (!Thread.supported ()) {
            error ("Cannot run without thread support.");
        }
        
        app = new DeskConfig ();
        app.run ();
        
        Gtk.main ();
        return 0;
    }
}


