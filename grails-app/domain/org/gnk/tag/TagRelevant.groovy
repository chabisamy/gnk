package org.gnk.tag

class TagRelevant {

    Integer id
    Integer version
    boolean relevantPlot
    boolean relevantRole
    boolean relevantResource
    boolean relevantPlace
    boolean relevantFirstname
    boolean relevantLastname

    static belongsTo = [ tag: Tag ]

    static constraints = {
    }

    static mapping = {
        id type: 'integer'
        version type: 'integer'
    }
}
