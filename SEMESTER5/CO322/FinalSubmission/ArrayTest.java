package com.company;

import org.junit.Before;
import org.junit.Test;


//import org.testing.annotations.Test;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;

/**
 * Created by Udaree on 7/14/2016.
 */
public class ArrayTest {

    private  Array intList1;
    private  Array intList2;

    @Before
    public void setUp() throws Exception {

        // Creating an empty array
        intList1 = new Array();

        // Creating an array with 5 elements
        intList2 = new Array(5);

    }


    // Initial test1
    @Test
    public void Test0() throws Exception {

        int [] actual = intList1.getArray();
        int [] expected = new int [0];

        assertArrayEquals(expected,actual);

    }

    // Initial test2
    @Test
    public void Test00() throws Exception {

        int [] actual = intList2.getArray();
        int [] expected = new int [] {0, 0, 0, 0, 0};

        assertArrayEquals(expected,actual);

    }
    //Testing add(int d)
    @Test
    public void addTest1() throws Exception {


        intList1.add(1);

        int[] actual = intList1.getArray();
        int[] expected = new int[]{1};

        assertArrayEquals(expected, actual);
    }

    @Test
    public void addTest2() throws Exception {

        intList2.add(1);

        int [] actual = intList2.getArray();
        int [] expected = new int [] {0, 0, 0, 0, 0, 1};

        assertArrayEquals(expected,actual);

    }

    @Test
    public void addTest3() throws Exception {

        intList1.add(1);
        intList1.add(10);

        int[] actual = intList1.getArray();
        int[] expected = new int[]{1, 10};

        assertArrayEquals(expected, actual);

    }

    @Test
    public void addTest4() throws Exception {

        intList2.add(1);
        intList2.add(10);

        int [] actual = intList2.getArray();
        int [] expected = new int [] {0, 0, 0, 0, 0, 1, 10};

        assertArrayEquals(expected,actual);

    }

    //Testing add(int d)
    //Testing Exceptions
   @Test( expected = ArrayIndexOutOfBoundsException.class)
   public void add1ETest1ArrayIndexOutOfBoundsException() throws Exception {

        intList1.add(0,1);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
   public void add1ETest2ArrayIndexOutOfBoundsException() throws Exception {

        intList1.add(-1,10);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void add1ETest3ArrayIndexOutOfBoundsException() throws Exception {

        intList2.add(6,20);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void add1ETest4ArrayIndexOutOfBoundsException() throws Exception {

        intList2.add(-1,0);

    }
    //Testing with no exceptions
    @Test
    public void add1Test1() throws Exception {

        intList2.add(0, 10);

        int[] actual = intList2.getArray();
        int[] expected = new int[]{10, 0, 0, 0, 0, 0};

        assertArrayEquals(expected, actual);
    }

    @Test
    public void add1Test2() throws Exception {

        intList2.add(4, 1);

        int[] actual = intList2.getArray();
        int[] expected = new int[]{0, 0, 0, 0, 1, 0};

        assertArrayEquals(expected, actual);

    }

    @Test
    public void add1Test3() throws Exception {

        intList2.add(3, 100);

        int[] actual = intList2.getArray();
        int[] expected = new int[]{0, 0, 0, 100, 0, 0};

        assertArrayEquals(expected, actual);

    }


    //Testing replace(int index, int d)
    //With exceptions
    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void replaceETest1ArrayIndexOutOfBoundsException() throws Exception {

        intList1.add(0,1);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void replaceETest2ArrayIndexOutOfBoundsException() throws Exception {

        intList1.add(-1,10);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void replaceETest3ArrayIndexOutOfBoundsException() throws Exception {

        intList2.add(50,20);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void replaceETest4ArrayIndexOutOfBoundsException() throws Exception {

        intList2.add(-1,0);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void replaceETest5ArrayIndexOutOfBoundsException() throws Exception {

        intList2.add(100,0);

    }

    //Without exceptions
    @Test
    public void replaceTest1() throws Exception {

        intList2.replace(0, 5);

        int[] actual6 = intList2.getArray();
        int[] expected6 = new int[]{5, 0, 0, 0, 0};

        assertArrayEquals(expected6, actual6);
    }

    @Test
    public void replaceTest2() throws Exception {

        intList2.replace(4, 10);

        int[] actual6 = intList2.getArray();
        int[] expected6 = new int[]{0, 0, 0, 0, 10};

        assertArrayEquals(expected6, actual6);
    }

    @Test
    public void replaceTest3() throws Exception {

        intList2.replace(2, 10);

        int[] actual7 = intList2.getArray();
        int[] expected7 = new int[]{0, 0, 10, 0, 0};

        assertArrayEquals(expected7, actual7);
    }

    //Testing remove(int index)
    //With exceptions
    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void removeETest1ArrayIndexOutOfBoundsException() throws Exception {

        intList1.remove(0);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void removeETest2ArrayIndexOutOfBoundsException() throws Exception {

        intList1.remove(-1);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void removeETest3ArrayIndexOutOfBoundsException() throws Exception {

        intList1.remove(100);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void removeETest4ArrayIndexOutOfBoundsException() throws Exception {

        intList2.remove(-1);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void removeETest5ArrayIndexOutOfBoundsException() throws Exception {

        intList2.remove(50);

    }

    //without exceptions
    @Test
    public void removeTest1() throws Exception {

        intList2.replace(0,1);
        intList2.remove(0);

        int[] actual = intList2.getArray();
        int[] expected = new int[]{0, 0, 0, 0};

        assertArrayEquals(expected, actual);
    }

    @Test
    public void removeTest2() throws Exception {

        intList2.remove(3);

        int[] actual = intList2.getArray();
        int[] expected = new int[]{0, 0, 0, 0};

        assertArrayEquals(expected, actual);

    }

    @Test
    public void removeTest3() throws Exception {

        intList2.remove(3);
        intList2.remove(3);


        int[] actual = intList2.getArray();
        int[] expected = new int[]{0, 0, 0};

        assertArrayEquals(expected, actual);

    }

    // Testing get(int index)
    // Testing Exceptions
    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void getETest1ArrayIndexOutOfBoundsException() throws Exception {

        intList1.get(0);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void getETest2ArrayIndexOutOfBoundsException() throws Exception {

        intList1.get(-1);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void getETest3ArrayIndexOutOfBoundsException() throws Exception {

        intList1.get(100);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void getETest4ArrayIndexOutOfBoundsException() throws Exception {

        intList2.get(-1);

    }

    @Test( expected = ArrayIndexOutOfBoundsException.class)
    public void getETest5ArrayIndexOutOfBoundsException() throws Exception {

        intList2.get(500);

    }

    //Testing without exceptions
    @Test
    public void getTest1() throws Exception {

        int actual = intList2.get(0);
        int expected = 0;

        assertEquals(expected, actual);
    }

    @Test
    public void getTest2() throws Exception {

        int actual1 = intList2.get(4);
        int expected1 = 0;

        assertEquals(expected1,actual1);

    }

    //Testing isEmpty()
    @Test
    public void isEmptyTest1() throws Exception {

        boolean actual = intList1.isEmpty();
        boolean expected = true;

        assertEquals(expected, actual);
    }

    @Test
    public void isEmptyTest2() throws Exception {

        intList1.add(6);

        boolean actual = intList1.isEmpty();
        boolean expected = false;

        assertEquals(expected, actual);
    }

    @Test
    public void isEmptyTest3() throws Exception {

        boolean actual1 = intList2.isEmpty();
        boolean expected1 = false;

        assertEquals(expected1,actual1);
    }

    @Test
    public void isEmptyTest4() throws Exception {

        intList2.clear();

        boolean actual1 = intList2.isEmpty();
        boolean expected1 = true;

        assertEquals(expected1,actual1);
    }

    @Test
    public void sizeTest1() throws Exception {

        int actual2 = intList1.size();
        int expected2 = 0;

        assertEquals(expected2, actual2);
    }

    @Test
    public void sizeTest2() throws Exception {

        int actual3 = intList2.size();
        int expected3 = 5;

        assertEquals(expected3, actual3);
    }

    @Test
    public void sizeTest3() throws Exception {

        intList1.add(10);

        int actual4 = intList1.size();
        int expected4 = 1;

        assertEquals(expected4, actual4);
    }


    @Test
    public void sizeTest4() throws Exception {

        intList2.add(10);

        int actual5 = intList2.size();
        int expected5 = 6;

        assertEquals(expected5,actual5);

    }


    @Test
    public void containsTest1() throws Exception {

        boolean actual = intList1.contains(0);
        boolean expected = false;

        assertEquals(expected, actual);
    }

    @Test
    public void containsTest2() throws Exception {

        boolean actual1 = intList2.contains(0);
        boolean expected1 = true;

        assertEquals(expected1, actual1);
    }

    @Test
    public void containsTest3() throws Exception {

        boolean actual2 = intList2.contains(5);
        boolean expected2 = false;

        assertEquals(expected2, actual2);
    }

    @Test
    public void containsTest4() throws Exception {

        intList2.add(5);
        boolean actual3 = intList2.contains(5);
        boolean expected3 = true;

        assertEquals(expected3,actual3);

    }

    @Test
    public void trimToSizeTest1() throws Exception {

        intList1 = new Array(10);

        intList1.trimToSize(5);

        int[] expected = new int[]{0, 0, 0, 0, 0};
        int[] actual = intList1.getArray();

        assertArrayEquals(expected,actual);
    }

    @Test
    public void trimToSizeTest2() throws Exception {

        intList1 = new Array(5);

        intList1.trimToSize(5);

        int[] expected = new int[]{0, 0, 0, 0, 0};
        int[] actual = intList1.getArray();

        assertArrayEquals(expected,actual);
    }
    @Test
    public void trimToSizeTest3() throws Exception {

        intList1 = new Array(10);

        intList1.trimToSize(8);
        intList1.trimToSize(4);

        int[] expected = new int[]{0, 0, 0, 0};
        int[] actual = intList1.getArray();

        assertArrayEquals(expected,actual);
    }

    @Test
    public void clearTest1() throws Exception {

        intList1.clear();

        int[] expected = new int[]{};
        int[] actual = intList1.getArray();

        assertArrayEquals(expected, actual);
    }

    @Test
    public void clearTest2() throws Exception {

        intList2.clear();

        int [] expected1 = new int [] {};
        int [] actual1 = intList2.getArray();

        assertArrayEquals(expected1,actual1);

    }

    @Test
    public void clearTest3() throws Exception {

        intList2 = new Array(10);
        intList2.clear();

        intList2 = new Array(20);
        intList2.clear();

        int [] expected1 = new int [] {};
        int [] actual1 = intList2.getArray();

        assertArrayEquals(expected1,actual1);

    }

}