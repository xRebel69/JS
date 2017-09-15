class Motor {
  FBox staticRod;
  FBox spinningRod;
  FRevoluteJoint joint;

  boolean enable = false;
  Motor() {
    addStaticRod();
    spinningRod();
    joint = new FRevoluteJoint(staticRod, spinningRod, width/2, height/2-20);
    switchMotor();
    joint.setMotorSpeed(PI*2*2);
    joint.setMaxMotorTorque(1000);
    world.add(joint);
  }

  void switchMotor() {
    if (enable) {

      joint.setEnableMotor(false);
      enable=false;
    } else {
      joint.setEnableMotor(true);
      enable = true;
    }
  }
  void addStaticRod() {
    staticRod = new FBox(10, 40);
    staticRod.setPosition(width/2, height/2);
    staticRod.setStatic(true);
    staticRod.setGrabbable(false);
    world.add(staticRod);
  }

  void spinningRod() {
    spinningRod = new FBox(170, 5);
    spinningRod.setPosition(width/2, height/2-20);
    spinningRod.setStatic(false);
    spinningRod.setFill(255, 0, 0);
    spinningRod.setGrabbable(false);
    world.add(spinningRod);
  }
}