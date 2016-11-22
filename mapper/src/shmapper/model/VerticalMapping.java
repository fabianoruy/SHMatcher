package shmapper.model;

/* Represents a Vertical Mapping between a Model and an Ontology. */
public class VerticalMapping extends Mapping {
	private static final long	serialVersionUID	= -7873764022001248669L;
	private SeonView			target;

	public VerticalMapping(StandardModel base, SeonView target) {
		super(base);
		this.target = target;
	}

	@Override
	public SeonView getTarget() {
		return target;
	}

}