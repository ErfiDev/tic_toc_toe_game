class InfoType {
  int index;
  bool user;

  InfoType(this.index, this.user);

  @override
  String toString() {
    return 'the player ${user ? 'one' : 'two'} clicked index $index';
  }
}
