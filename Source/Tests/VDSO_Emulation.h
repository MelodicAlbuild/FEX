#pragma once
#include <FEXCore/IR/IR.h>

namespace FEX::VDSO {
  using MapperFn = std::function<void *(void *addr, size_t length, int prot, int flags, int fd, off_t offset)>;
  void* LoadVDSOThunks(MapperFn Mapper);

  std::vector<FEXCore::IR::ThunkDefinition> const& GetVDSOThunkDefinitions();
}
