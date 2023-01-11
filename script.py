from MesaHandler.MesaProjHandler import ProjectOps
from MesaHandler import MesaAccess
import glob
from alive_progress import alive_bar

inlists = glob.glob("inlists/*_inlist_*")
print(inlists)

dsct = ProjectOps("dsct")       
dsct.create(overwrite=True, clean=True)             
dsct.make()


with alive_bar(unknown="waves") as bar:
    for i in range(1,3):
        dsct.loadProjInlist(inlists[i])
        dsct.run(silent=True)
        file = open("runlog", "a")  # append mode
        file.write( "\n\n"+("*"*100)+"\n\n" )
        file.close()
        bar()


# dsct.rerun("x450")
# dsct.clean()              ## Clean the project
