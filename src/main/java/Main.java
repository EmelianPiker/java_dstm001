import com.joemelsha.crypto.hash.*;

import java.nio.*;
import java.security.*;
import java.text.*;

import java.util.Arrays;



public class Main {
  public static void main(String[] args) {
    System.out.println("This will be printed");
    Keccak a = new Keccak(256);
    byte[] b = { 1, 2, 3 };
    a.update(b);
    byte[] c = a.digestArray(256);
    int i;
    for (i=0; i<32; i++) {
    	System.out.format("%x",c[i]);
    }
    System.out.format("\n");
    MerkleTree d = new MerkleTree();
    MerkleNode e = new MerkleNode(MerkleHash.create(b));
    b[0] = 100;
    MerkleNode f = new MerkleNode(MerkleHash.create(b));
    b[0] = 101;
    MerkleNode g = new MerkleNode(MerkleHash.create(b));
    b[0] = 102;
    MerkleNode h = new MerkleNode(MerkleHash.create(b));
    d.buildTree(Arrays.asList(e,f,g,h));
    System.out.println(d.getRoot().toString());
  }
}
