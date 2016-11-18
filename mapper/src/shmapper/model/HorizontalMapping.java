package shmapper.model;

/* Represents a Horizontal Mapping between two Models. */
public class HorizontalMapping extends Mapping {
	private StandardModel target;

	public HorizontalMapping(StandardModel base, StandardModel target) {
		super(base);
		this.target = target;
	}

	@Override
	public StandardModel getTarget() {
		return target;
	}

}