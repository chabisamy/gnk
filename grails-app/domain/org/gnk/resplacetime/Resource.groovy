package org.gnk.resplacetime

import org.gnk.utils.Pair
import org.gnk.tag.Tag

class Resource extends ReferentialObject {



//    static belongsTo = [ genericResource: GenericResource] // Dump20131114-version 2.1

	static hasMany = [ extTags: ResourceHasTag]

	static constraints = {
		name (maxSize: 45)
		description (nullable: true)
		gender (maxSize: 2)
	}

    static mapping = {
        description type: 'text'
        id type:'integer'
        version type: 'integer'
    }

	ArrayList<Tag> getTags() {
		return null;
	}

	ArrayList<Pair<Tag, Integer>> getTagsAndWeights() {
		return null;
	}

}
