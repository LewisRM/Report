package hreport.core.db.table


import com.hand.hap.liquibase.MigrationHelper

def mhi = MigrationHelper.getInstance()
dbType = MigrationHelper.getInstance().dbType()

databaseChangeLog(logicalFilePath:"hreport/core/db/2016-06-01-init-data.groovy"){


    changeSet(author: "yourname", id: "20160601-yourname-1") {
            sqlFile(path: MigrationHelper.getInstance().dataPath("com/hand/hap/db/data/"+dbType+"/demo.sql"), encoding: "UTF-8")
    }
}
