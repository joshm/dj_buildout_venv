#!/var/venv/[appname]/bin/python
import os
import sys
import imp

def start():
        venv = '/var/venv/[appname]/'
        os.chdir(venv)
        activate_this = venv + '/bin/activate_this.py'
        # activate virtualenv
        execfile(activate_this, dict(__file__=activate_this))

        # start montitoring for changes and reload code/ restart fcgi as necessry
        import monitor
        monitor.start(interval=1.0)

        # start the fcgi process
        imp.load_source('[appname]_startup', '/var/venv/[appname]/bin/django.fcgi');
        import [appname]_startup

if __name__ == '
