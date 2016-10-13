package org.gnk.resplacetime

import javafx.util.Pair
import org.gnk.roletoperso.Role
import org.gnk.roletoperso.RoleHasEvent
import org.gnk.roletoperso.RoleHasEventHasGenericResource
import org.gnk.selectintrigue.Plot
import org.gnk.tag.Tag

class GenericResource extends GenericObject{


    // Ingame Clue :
    String title
    String description
    String fromRoleText
    String toRoleText


    static belongsTo = [plot: Plot, fromRole: Role, toRole: Role, possessedByRole: Role, objectType: ObjectType]

    // Id referenced into DTD
    static transients = ["DTDId", "proposedResources", "bannedResources", "selectedResource"]


    List<Resource> proposedResources
    List<Resource> bannedResources
    Resource selectedResource

	static hasMany = [ extTags: GenericResourceHasTag,
	                   roleHasEventHasRessources: RoleHasEventHasGenericResource]

    static constraints = {
        title maxSize: 75
        code (blank: false, maxSize: 45, unique: false)
        comment (nullable: true)
        title (nullable: true)
        description (nullable: true)
        fromRole (nullable: true)
        toRole (nullable: true)
        possessedByRole (nullable: true)
        fromRoleText (nullable: true)
        toRoleText (nullable: true)
        gnConstant (nullable: true)
    }



    static mapping = {
        comment type: 'text'
        description type: 'text'
        fromRoleText: 'text'
        toRoleText: 'text'
        id type:'integer'
        version type: 'integer'
        extTags cascade:'all-delete-orphan'
    }

    public boolean hasGenericResourceTag(Tag parGenericResourceTag) {
        return (GenericResourceHasTag.findByTagAndGenericResource(parGenericResourceTag, this) != null)
    }

    public getGenericResourceHasRoleHasEvent(RoleHasEvent roleHasEvent) {
        if (roleHasEvent == null) {
            return null;
        }
        List<RoleHasEventHasGenericResource> roleHasEventHasGenericResources = RoleHasEventHasGenericResource.createCriteria().list {
            like("genericResource", this)
            like("roleHasEvent", roleHasEvent)
        }
        if (roleHasEventHasGenericResources.size() == 0) {
            return null;
        }
        return roleHasEventHasGenericResources.first();
    }

    public getGenericResourceHasTag(Tag tag) {
        return GenericResourceHasTag.findByTagAndGenericResource(tag, this);
    }

    boolean isIngameClue()
    {
        return ((this.title != null) && (!this.title.isEmpty()) && (this.description != null)) && (!this.description.isEmpty())
    }

    ArrayList<Tag> getTags() {
        return null;
    }
    Map<Tag, Integer> getTagsAndWeights() {
        return null;
    }
    ArrayList<ReferentialObject> getReferentialObject() {
        return Resource.all;
    }
}


/*
GenericRessourceHasIngameClue.groovy :


package org.gnk.resplacetime

class GenericResourceHasIngameClue {

    Integer id
    Integer version

    Date lastUpdated
	Date dateCreated
    String title
	String description

	static belongsTo = [ genericResource: GenericResource ]

    static constraints = {
        title (maxSize: 75)
//        description (nullable: true)
    }

    static mapping = {
        description type: 'text'
        id type:'integer'
        version type: 'integer'
    }

    GenericResourceHasIngameClue(GenericResource genericResource, String title, String description) {
        this.genericResource = genericResource
        this.title = title
        this.description = description
    }
}

 */