#ifndef DATAMODEL_ExampleWithNamespaceDATA_H
#define DATAMODEL_ExampleWithNamespaceDATA_H

#include "ALPDataIO/datamodel/NamespaceStruct.h"

namespace ex42 {
/** @class ExampleWithNamespaceData
 *  Type with namespace and namespaced member
 *  @author: Joschka Lingemann
 */

class ExampleWithNamespaceData {
public:
  ex2::NamespaceStruct data;  ///< a component
};
} // namespace ex42

#endif
