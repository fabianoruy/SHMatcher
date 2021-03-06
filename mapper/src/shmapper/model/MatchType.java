package shmapper.model;

/* Represents the MatchType of a Concept on an Element in a match. */
public enum MatchType {
	EQUIVALENT("is EQUIVALENT to"),
	PARTIAL("is PART of"),
	WIDER("is WIDER than"),
	OVERLAP("has an OVERLAP with"),
	CORRESPONDENCE("is (structurally) CORRESPONDENT with"),
	SPECIALIZATION("is SPECIALIZATION of"),
	GENERALIZATION("is GENERALIZATION of"),
	ACTS("ACTS as"),
	BYACTED("is ACTED BY"),
	NORELATION("has NO RELATION.");
		
	private final String text;
	
    private MatchType (final String text) {
        this.text = text;
    }
    
    public String getText() {
    	return text;
    }
    
    @Override
    public String toString() {
        return text;
    }
    
    public String getAbbreviation() {
		return "[" + this.name().charAt(0) + "]";
    }

	public MatchType getReflex() {
		if(this == MatchType.PARTIAL)
			return MatchType.WIDER;
		if(this == MatchType.WIDER)
			return MatchType.PARTIAL;
		if(this == MatchType.SPECIALIZATION)
			return MatchType.GENERALIZATION;
		if(this == MatchType.GENERALIZATION)
			return MatchType.SPECIALIZATION;
		if(this == MatchType.ACTS)
			return MatchType.BYACTED;
		if(this == MatchType.BYACTED)
			return MatchType.ACTS;
		return this;
	}
}