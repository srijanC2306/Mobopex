// Function for performing binary search
int binarySearch(List<int> sortedList, int target) {
  int start = 0;
  int end = sortedList.length - 1;

  while (start <= end) {
    int mid = start + ((end - start) >> 1); // Find the middle index
    if (sortedList[mid] == target) {
      return mid; // Target found, return its index
    } else if (sortedList[mid] > target) {
      end = mid - 1; // Target is in the left half
    } else {
      start = mid + 1; // Target is in the right half
    }
  }

  return -1; // Target not found
}

// Main function to demonstrate binary search
void main() {
  List<int> sortedList = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21];
  int target = 13;

  int result = binarySearch(sortedList, target);
  if (result != -1) {
    print("Element found at index: $result");
  } else {
    print("Element not found in the list.");
  }
}
