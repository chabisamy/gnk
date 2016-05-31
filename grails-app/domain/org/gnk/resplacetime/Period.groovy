package org.gnk.resplacetime

import org.apache.commons.lang3.time.DateUtils
import org.gnk.gn.Gn

/**
 * A period is defined from its beginning and its duration
 */
class Period {

    Integer id
    Integer version
    Date lastUpdated
    Date dateCreated

    String name
    String description
    String location
    /**
     * Whether the period is visible only for the orga or also for the players
     */
    Boolean isPublic
    /**
     * The start of the period
     */
    Date beginning
    /**
     * The period will not allow other period or event to be planned within its duration in the Times Substitution algorithm
     */
    Boolean isBlocking
    /**
     * The duration of the period in minutes
     */
    Boolean isGamePeriod

    Long duration
    /**
     * mapping composition N-1 to Gn
     */
    static belongsTo = [gn: Gn]

    Period periodPredecessor

    /**
     * The interval in minutes between the predecessor and the period
     */
    Long predInterval

    static transients = ["absoluteYear", "absoluteMonth", "absoluteDay", "absoluteHour", "absoluteMinute"]

    Integer absoluteYear
    Integer absoluteMonth
    Integer absoluteDay
    Integer absoluteHour
    Integer absoluteMinute


    static constraints = {
    }
    static mapping = {
        description type: 'text'
        id type:'integer'
        version type: 'integer'
//      periodPredecessor (nullable:true)
    }

    /**
     *
     * This function set the beginning of the period from the integers Absolute times attributes.
     * Those integer values are a legacy carried because of the XML dtd translation
     * This function won't work with null in absoluteX (Time) parameters but will handle negative values
     *
    private void setBeginingFromXML() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(absoluteYear, absoluteMonth, absoluteDay, absoluteHour, absoluteMinute);
        Date beginning = calendar.getTime();
    }

    Boolean getIsBlocking() {
        return isBlocking
    }

    void setIsBlocking(Boolean isBlocking) {

        if(isBlocking == false) {
            this.isBlocking = false
            return
        }
        if(this.beginning == null || this.duration == null || this.gn == null) {
            this.isBlocking = false
            return
        }
        Boolean allowed = true
        //Integer GnId = this.gn.id
        def blockingPeriods = Period.where {gn == this.gn && isBlocking == true}.list()
                //.findAllByGnAndIsBlocking(this.gn, true)
                //.where {Gn.id == n && isBlocking == true}.list()
        blockingPeriods.each { Period p ->
            if(p == null)
                return
            Console.println(p.name + " test")
            Date end =  DateUtils.addMinutes(this.beginning, this.duration)
            Date pEnd =  DateUtils.addMinutes(p.beginning, p.duration)
            //If the beginning of a period is during
            Boolean beginsDuringPeriod = (this.beginning.before(p.beginning) || beginning.equals(p.beginning)) &&
                    end.after(p.beginning)
            Boolean endsDuringPeriod = beginning.before(pEnd) && (end.after(pEnd) || end.equals(pEnd))
            Boolean periodInsideP = (p.beginning.before(beginning) || p.beginning.equals(beginning)) &&
                    (pEnd.after(end) || pEnd.equals(end))
            //TODO
            //Boolean pInsidePeriod =

            allowed = allowed && !beginsDuringPeriod && !endsDuringPeriod && !periodInsideP //!pInsidePeriod
        }
        this.isBlocking = allowed
    }
    */

    //enrichir le contructeur pour les dates de début relatives
    //toJSON
    //fromJSON
    //isDuring(Period period)
    //isduring
}