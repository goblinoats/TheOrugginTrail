// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

ResourceId constant _tableId = ResourceId.wrap(bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("Room"))));
ResourceId constant RoomTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0000000200000000000000000000000000000000000000000000000000000000
);

struct RoomData {
  uint32[8] textDefId;
  uint32[8] actions;
}

library Room {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.UINT32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](2);
    _valueSchema[0] = SchemaType.UINT32_ARRAY;
    _valueSchema[1] = SchemaType.UINT32_ARRAY;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "roomId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](2);
    fieldNames[0] = "textDefId";
    fieldNames[1] = "actions";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get textDefId.
   */
  function getTextDefId(uint32 roomId) internal view returns (uint32[8] memory textDefId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return toStaticArray_uint32_8(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Get textDefId.
   */
  function _getTextDefId(uint32 roomId) internal view returns (uint32[8] memory textDefId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return toStaticArray_uint32_8(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Set textDefId.
   */
  function setTextDefId(uint32 roomId, uint32[8] memory textDefId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode(fromStaticArray_uint32_8(textDefId)));
  }

  /**
   * @notice Set textDefId.
   */
  function _setTextDefId(uint32 roomId, uint32[8] memory textDefId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode(fromStaticArray_uint32_8(textDefId)));
  }

  /**
   * @notice Get the length of textDefId.
   */
  function lengthTextDefId(uint32 roomId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get the length of textDefId.
   */
  function _lengthTextDefId(uint32 roomId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get an item of textDefId.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemTextDefId(uint32 roomId, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Get an item of textDefId.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemTextDefId(uint32 roomId, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Push an element to textDefId.
   */
  function pushTextDefId(uint32 roomId, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to textDefId.
   */
  function _pushTextDefId(uint32 roomId, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from textDefId.
   */
  function popTextDefId(uint32 roomId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 4);
  }

  /**
   * @notice Pop an element from textDefId.
   */
  function _popTextDefId(uint32 roomId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 4);
  }

  /**
   * @notice Update an element of textDefId at `_index`.
   */
  function updateTextDefId(uint32 roomId, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of textDefId at `_index`.
   */
  function _updateTextDefId(uint32 roomId, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get actions.
   */
  function getActions(uint32 roomId) internal view returns (uint32[8] memory actions) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return toStaticArray_uint32_8(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Get actions.
   */
  function _getActions(uint32 roomId) internal view returns (uint32[8] memory actions) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return toStaticArray_uint32_8(SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_uint32());
  }

  /**
   * @notice Set actions.
   */
  function setActions(uint32 roomId, uint32[8] memory actions) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, EncodeArray.encode(fromStaticArray_uint32_8(actions)));
  }

  /**
   * @notice Set actions.
   */
  function _setActions(uint32 roomId, uint32[8] memory actions) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, EncodeArray.encode(fromStaticArray_uint32_8(actions)));
  }

  /**
   * @notice Get the length of actions.
   */
  function lengthActions(uint32 roomId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get the length of actions.
   */
  function _lengthActions(uint32 roomId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 4;
    }
  }

  /**
   * @notice Get an item of actions.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemActions(uint32 roomId, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Get an item of actions.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemActions(uint32 roomId, uint256 _index) internal view returns (uint32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 4, (_index + 1) * 4);
      return (uint32(bytes4(_blob)));
    }
  }

  /**
   * @notice Push an element to actions.
   */
  function pushActions(uint32 roomId, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to actions.
   */
  function _pushActions(uint32 roomId, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 1, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from actions.
   */
  function popActions(uint32 roomId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 1, 4);
  }

  /**
   * @notice Pop an element from actions.
   */
  function _popActions(uint32 roomId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 1, 4);
  }

  /**
   * @notice Update an element of actions at `_index`.
   */
  function updateActions(uint32 roomId, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of actions at `_index`.
   */
  function _updateActions(uint32 roomId, uint256 _index, uint32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 4), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(uint32 roomId) internal view returns (RoomData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(uint32 roomId) internal view returns (RoomData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(uint32 roomId, uint32[8] memory textDefId, uint32[8] memory actions) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(textDefId, actions);
    bytes memory _dynamicData = encodeDynamic(textDefId, actions);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(uint32 roomId, uint32[8] memory textDefId, uint32[8] memory actions) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(textDefId, actions);
    bytes memory _dynamicData = encodeDynamic(textDefId, actions);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint32 roomId, RoomData memory _table) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(_table.textDefId, _table.actions);
    bytes memory _dynamicData = encodeDynamic(_table.textDefId, _table.actions);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint32 roomId, RoomData memory _table) internal {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(_table.textDefId, _table.actions);
    bytes memory _dynamicData = encodeDynamic(_table.textDefId, _table.actions);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    PackedCounter _encodedLengths,
    bytes memory _blob
  ) internal pure returns (uint32[8] memory textDefId, uint32[8] memory actions) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    textDefId = toStaticArray_uint32_8(SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint32());

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    actions = toStaticArray_uint32_8(SliceLib.getSubslice(_blob, _start, _end).decodeArray_uint32());
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   *
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory,
    PackedCounter _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (RoomData memory _table) {
    (_table.textDefId, _table.actions) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint32 roomId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint32 roomId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(
    uint32[8] memory textDefId,
    uint32[8] memory actions
  ) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(textDefId.length * 4, actions.length * 4);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(uint32[8] memory textDefId, uint32[8] memory actions) internal pure returns (bytes memory) {
    return
      abi.encodePacked(
        EncodeArray.encode(fromStaticArray_uint32_8(textDefId)),
        EncodeArray.encode(fromStaticArray_uint32_8(actions))
      );
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint32[8] memory textDefId,
    uint32[8] memory actions
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(textDefId, actions);
    bytes memory _dynamicData = encodeDynamic(textDefId, actions);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint32 roomId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(roomId));

    return _keyTuple;
  }
}

/**
 * @notice Cast a dynamic array to a static array.
 * @dev In memory static arrays are just dynamic arrays without the 32 length bytes,
 * so this function moves the pointer to the first element of the dynamic array.
 * If the length of the dynamic array is smaller than the static length,
 * the function returns an uninitialized array to avoid memory corruption.
 * @param _value The dynamic array to cast.
 * @return _result The static array.
 */
function toStaticArray_uint32_8(uint32[] memory _value) pure returns (uint32[8] memory _result) {
  if (_value.length < 8) {
    // return an uninitialized array if the length is smaller than the fixed length to avoid memory corruption
    return _result;
  } else {
    // in memory static arrays are just dynamic arrays without the 32 length bytes
    // (without the length check this could lead to memory corruption)
    assembly {
      _result := add(_value, 0x20)
    }
  }
}

/**
 * @notice Copy a static array to a dynamic array.
 * @dev Static arrays don't have a length prefix, so this function copies the memory from the static array to a new dynamic array.
 * @param _value The static array to copy.
 * @return _result The dynamic array.
 */
function fromStaticArray_uint32_8(uint32[8] memory _value) pure returns (uint32[] memory _result) {
  _result = new uint32[](8);
  uint256 fromPointer;
  uint256 toPointer;
  assembly {
    fromPointer := _value
    toPointer := add(_result, 0x20)
  }
  Memory.copy(fromPointer, toPointer, 256);
}
