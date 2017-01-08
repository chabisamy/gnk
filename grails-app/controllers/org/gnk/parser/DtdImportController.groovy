package org.gnk.parser

import org.gnk.ErrorHandlerService
import org.springframework.web.multipart.MultipartFile

class DtdImportController {

    static defaultAction = "importDtd"

    def index() {
        //      redirect(view: "import")
    }
     ErrorHandlerService errorHandlerService
    def importDtd() {

    }

    def readFromDTD() {
        try {
            MultipartFile dtdFile = request.getFile('file')
            GNKDataContainerService gnk = new GNKDataContainerService()
            gnk.ImportDTD(dtdFile)
            flash.messageInfo = "Import réussi du fichier '" + dtdFile.originalFilename + "'"
            // Ici on peut récupérer le gn, faire des traitements, etc...
        }
        catch (Exception e) {
            flash.message = "Echec de l'import du fichier"
            e.printStackTrace();
         errorHandlerService.filesendingerror();


        }
        redirect(action: "importDtd")
    }
}
