from MesaHandler.MesaProjHandler import ProjectOps
from MesaHandler import MesaAccess
from alive_progress import alive_bar

dsct = ProjectOps("dsct")       
dsct.create(overwrite=True, clean=True)             
dsct.make()
dsct.loadPGstarInlist( "inlists/pgstar_dsct" )

dsct.loadProjInlist( "inlists/1_test" )
# dsct.run(silent=True)
dsct.run()

dsct.loadProjInlist( "inlists/6_test" )
# dsct.run(silent=True)
dsct.run()


# with alive_bar(unknown="waves") as bar:
#     for i in range(1,3):
#         dsct.loadProjInlist( "inlists/%i_test"%(i+1) )
#         dsct.run(silent=True)
#         bar()


# dsct.rerun("x450")
# dsct.clean()              ## Clean the project
