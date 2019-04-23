Demonstrate use of base class with replicated new.

- A replicated class is instantiated using the factory.
- Cilk migrate hint on nodelet 2 given.
- fn is spawned on nodelet 2, which allocates a long and puts the pointer
  into the a_ array.
- The correct number of migrations is observed:
  - main thread migrates to 2 to spawn
  - main thread returns to 0
  - thread spawned on 2 returns to 0
  