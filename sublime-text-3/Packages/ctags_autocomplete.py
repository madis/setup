# CTags based autocompletion plugin for Sublime Text 2
# You can add the file to the User Package in ~/Library/Application Support/Sublime Text 2/Packages and restart Sublime Text 2.
# generate the .tags file in your project root with "ctags -R -f .tags"

import sublime, sublime_plugin, os, subprocess

class AutocompleteAll(sublime_plugin.EventListener):

    def on_query_completions(self, view, prefix, locations):
        results=[]
        tags_paths = [folder + '/.tags' for folder in view.window().folders()]
        for tags_path in tags_paths:
            if (not view.window().folders() or not os.path.exists(tags_path)): #check if a project is open and the .tags file exists
                return results
        tags_paths = ' '.join([str(x) for x in tags_paths])
        f=os.popen('grep -ih "^'+prefix+'" ' + tags_paths + ' | gawk "{ print $1 }"') # egrep tags from project directory .tags file
        for i in f.readlines():
            results.append([i.strip()])
        results = [(item,item) for sublist in results for item in sublist] #flatten
        results = list(set(results)) # make unique
        results.sort() # sort
        return results
