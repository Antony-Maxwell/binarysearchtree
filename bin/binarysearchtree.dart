class Node{
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree{
  Node? root;
  void insert(int data){
    Node? currentNode = root;
    if(currentNode == null){
      root = Node(data);
      return;
    }
    while(true){
      if(data < currentNode!.data){
        if(currentNode.left == null){
          currentNode.left = Node(data);
          break;
        }else{
          currentNode = currentNode.left;
        }
      }else{
        if(currentNode.right == null){
          currentNode.right = Node(data);
          break;
        }else{
          currentNode = currentNode.right;
        }
      }
    }
  }

  bool contains(int data){
    Node? currentNode = root;
    while(currentNode != null){
      if(data<currentNode.data){
        currentNode = currentNode.left;
      }else if(data>currentNode.data){
        currentNode = currentNode.right;
      }else{
        return true;
      }
    }
    return false;
  }

  remove(int data) {
    root = _remove(root, data);
  }

  Node? _remove(Node? node, int data) {
    if (node == null) return null;

    if (data < node.data) {
      node.left = _remove(node.left, data);
    } else if (data > node.data) {
      node.right = _remove(node.right, data);
    } else {
      if (node.left == null && node.right == null) {
        return null;
      }
      if (node.right == null) {
        return node.left;
      }else if(node.left == null) {
        return node.right;
      }
      Node? succesor = _findMin(node.right);
      node.data = succesor!.data;
      node.right = _remove(node.right, succesor.data);
    }
    return node;
  }

  Node? _findMin(Node? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node;
  }

  void inOrder(){
    //the order is     LEFT,ROOT,RIGHT    //
    inOrderHelper(root);
  }

  void inOrderHelper(Node? node){
    if(node != null){
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }
  void preOrder(){
    //the order is     ROOT,LEFT,RIGHT     //
    preOrderHelper(root);
  }

  void preOrderHelper(Node? node){
      if(node != null){
      print(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }
  void postOrder(){
    //the order is     LEFT,RIGHT,ROOT    //
    postOrderHelper(root);
  }
  void postOrderHelper(Node? node){
      if(node != null){
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }

  int findClosest(int target){
    Node? current = root;
    int closest = current!.data;
    while(current != null){
      if(target-closest > target-current.data){
          closest = current.data;
      }
      if(target<current.data){
        current = current.left;
      }else if(target>current.data){
        current = current.right;
      }else{
        break;
      }
    }
    return closest;
  }
}
void main(){
  BinarySearchTree tree = BinarySearchTree();
  tree.insert(4);
  tree.insert(8);
  tree.insert(9);
  tree.insert(10);
  tree.insert(11);
  tree.remove(10);
  // print(tree.findClosest(7));
  tree.inOrder();
  // print('____________________');
  // tree.preOrder();
  // print('____________________');
  // tree.postOrder();

  // print(tree.contains(9));
}