#pragma once

#include <vector>
#include <array>
#include <iostream>
#include <concepts>

namespace util {

enum class DictionaryAccessor {
    Fixed,
    Dynamic,
};

// This ensures that a valid storage config is size of 0, or not equal to fixed, or fixed.
template <DictionaryAccessor Accessor, std::size_t Size>
concept ValidStorageConfig = (Accessor != DictionaryAccessor::Fixed || Size > 0);


/// @brief General Dynamic or not; config storage format, this won't store entites, but could store relvent information, this could be user
/// game data or something like that. @todo convert the underlying structure from array to tree, so that this can be used fore entity storage.
/// Rather then refering to everything as some tree, it is a dictionary "collection of data". 
/// @tparam T - The datatype
/// @tparam Accessor - Fixed, or Dynamic
/// @tparam Size - For Fixed only the size you want your array to, be
template <typename T, DictionaryAccessor Accessor, std::size_t Size>
requires ValidStorageConfig<Accessor, Size>
class Dictionary {
    //.Think turnary
    using StorageType = std::conditional_t<
      Accessor == DictionaryAccessor::Fixed, std::array<T, Size>, std::vector<T>>;
    StorageType _data;
  
    public:
      Dictionary() = default; 
      Dictionary(int size) {

      }
      Dictionary(Dictionary& source) = delete;
      
      Dictionary(Dictionary&& other) { 

      };

      T& find() 
      {

      }

      std::vector<T> compare() 
      {

      }

      void print_type() {
        if constexpr (Accessor == DictionaryAccessor::Fixed) {
            std::cout << "Using fixed std::array of size " << Size << "\n";
        } else {
            std::cout << "Using dynamic std::vector\n";
        }
      }
};

/*

Dictionary d;
Dictionary a;

a | d; // could be return_ only the _data that differs from each of the arrays -- More on the side of xor.

*/

}
