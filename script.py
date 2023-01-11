from MesaHandler.MesaProjHandler import ProjectOps
from MesaHandler import MesaAccess
import glob
from alive_progress import alive_bar

inlists = glob.glob("inlists/*_inlist_*")

dsct = ProjectOps("dsct")       
dsct.create(overwrite=True, clean=True)             
dsct.make()

with alive_bar(unknown="waves") as bar:
    for i in range(6):
        dsct.loadProjInlist(inlists[i])
        dsct.run(silent=True)
        file = open("/workspace/MESA/dsct/runlog", "a")  # append mode
        file.write( "\n\n"+("*"*100)+"\n\n" )
        file.close()
        bar()


# dsct.rerun("x450")
# dsct.clean()              ## Clean the project
