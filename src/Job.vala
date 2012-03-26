/***********************************************************************************************************************
 * Job.vala
 * 
 * Copyright 2012 Axel FILMORE <axel.filmore@gmail.com>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License Version 2.
 * http://www.gnu.org/licenses/gpl-2.0.txt
 * 
 * Purpose: http://www.linuxquestions.org/linux/articles/Technical/New_GTK_Widgets_GtkAssistant
 * 
 **********************************************************************************************************************/


public class Job {
    
    private string _cmdline;
    private unowned Thread<void*>? _thread = null;
    private Mutex _mutex = new Mutex ();    
    
    // shared................
    private bool _is_running = false;
    
    
    public Job (string cmdline) {
        _cmdline = cmdline;
    }
    
    
    public bool run () {

//        stdout.printf ("start thread\n");
        
        try {
            _is_running = true;
            _thread = Thread.create<void*> (thread_func, true);
        
        } catch (ThreadError e) {
            debug(e.message);
        }
        
//        stdout.printf ("end thread\n");
        
        return true;
    
    }
    
    
    public string get_command_line () {
        return _cmdline;
    }
    
    public bool is_running () {
    
        bool is_running;
        
        _mutex.lock ();
        is_running = _is_running;
        _mutex.unlock ();
        
        return is_running;
    }
    
    
    private void* thread_func () {
        
//        stdout.printf ("enter thread_func\n");
        
//        mutex.lock ();
//        _is_running = true;
//        mutex.unlock ();
        
//        stdout.printf ("start process\n");
        
        try {
            GLib.Process.spawn_command_line_sync(_cmdline);
        } catch (Error e) {
            stdout.printf ("error %s\n", e.message);
        }
        
//        stdout.printf ("process terminated\n");
        
        _mutex.lock ();
        _is_running = false;
        _mutex.unlock ();
        
//        stdout.printf ("leave thread_func\n");
        
        return null;
        
    }

}

