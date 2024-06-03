project "spirv-tools"

dofile(_BUILD_DIR .. "/static_library.lua")

configuration { "*" }

uuid "D75A39FC-0E0D-470E-831A-4062825D451D"

local SPIRV_TOOLS_SRC_DIR = _3RDPARTY_DIR .. "/SPIRV-Tools"
local SPIRV_HEADERS_SRC_DIR = _3RDPARTY_DIR .. "/SPIRV-Headers"

--
-- Generation
--
local SPIRV_TOOLS_GEN_OUTPUT_DIR = SPIRV_TOOLS_SRC_DIR.."/out/gen"
local PYTHON_EXE = "/usr/local/rtc/python/3.8/bin/python"
if (os.is("windows")) then
  PYTHON_EXE = "C:/rtc/python/3.8/Scripts/python"
end
local JINJA2_PATH = _3RDPARTY_DIR .. "/jinja/src/jinja2"
local MARKUPSAFE_PATH = _3RDPARTY_DIR .. "markupsafe/src/markupsafe"

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --spirv-core-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/spirv.core.grammar.json --extinst-debuginfo-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.debuginfo.grammar.json --extinst-cldebuginfo100-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.opencl.debuginfo.100.grammar.json --core-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/core.insts-unified1.inc --operand-kinds-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/operand.kinds-unified1.inc --output-language=c++")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --spirv-core-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/spirv.core.grammar.json --extinst-debuginfo-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.debuginfo.grammar.json --extinst-cldebuginfo100-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.opencl.debuginfo.100.grammar.json --extension-enum-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/extension_enum.inc --enum-string-mapping-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/enum_string_mapping.inc --output-language=c++")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-opencl-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.opencl.std.100.grammar.json --opencl-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/opencl.std.insts.inc")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-glsl-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.glsl.std.450.grammar.json --glsl-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/glsl.std.450.insts.inc --output-language=c++")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.spv-amd-shader-explicit-vertex-parameter.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/spv-amd-shader-explicit-vertex-parameter.insts.inc --vendor-operand-kind-prefix=")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.spv-amd-shader-trinary-minmax.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/spv-amd-shader-trinary-minmax.insts.inc --vendor-operand-kind-prefix=")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.spv-amd-gcn-shader.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/spv-amd-gcn-shader.insts.inc --vendor-operand-kind-prefix=")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.spv-amd-shader-ballot.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/spv-amd-shader-ballot.insts.inc --vendor-operand-kind-prefix=")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.debuginfo.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/debuginfo.insts.inc --vendor-operand-kind-prefix=")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.opencl.debuginfo.100.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/opencl.debuginfo.100.insts.inc --vendor-operand-kind-prefix=CLDEBUG100_")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.100.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/nonsemantic.shader.debuginfo.100.insts.inc --vendor-operand-kind-prefix=SHDEBUG100_")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.nonsemantic.clspvreflection.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/nonsemantic.clspvreflection.insts.inc --vendor-operand-kind-prefix=")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_grammar_tables.py --extinst-vendor-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.nonsemantic.vkspreflection.grammar.json --vendor-insts-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/nonsemantic.vkspreflection.insts.inc --vendor-operand-kind-prefix=")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_language_headers.py --extinst-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.debuginfo.grammar.json --extinst-output-path="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/DebugInfo.h")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_language_headers.py --extinst-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.opencl.debuginfo.100.grammar.json --extinst-output-path="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/OpenCLDebugInfo100.h")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_language_headers.py --extinst-grammar="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/unified1/extinst.nonsemantic.shader.debuginfo.100.grammar.json --extinst-output-path="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/NonSemanticShaderDebugInfo100.h")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/generate_registry_tables.py --xml="..SPIRV_HEADERS_SRC_DIR.."/include/spirv/spir-v.xml --generator-output="..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/generators.inc")

os.execute(PYTHON_EXE.." "..SPIRV_TOOLS_SRC_DIR.."/utils/update_build_version.py "..SPIRV_TOOLS_SRC_DIR.."/CHANGES "..SPIRV_TOOLS_GEN_OUTPUT_DIR.."/build-version.inc")

includedirs {
  SPIRV_TOOLS_GEN_OUTPUT_DIR,
  "include",
  ".",

  _3RDPARTY_DIR .. "/SPIRV-Headers/include",
}

files {
  "source/util/bit_vector.cpp",
  "source/util/parse_number.cpp",
  "source/util/string_utils.cpp",
  "source/assembly_grammar.cpp",
  "source/binary.cpp",
  "source/diagnostic.cpp",
  "source/disassemble.cpp",
  "source/enum_string_mapping.cpp",
  "source/ext_inst.cpp",
  "source/extensions.cpp",
  "source/libspirv.cpp",
  "source/name_mapper.cpp",
  "source/opcode.cpp",
  "source/operand.cpp",
  "source/parsed_operand.cpp",
  "source/print.cpp",
  "source/software_version.cpp",
  "source/spirv_endian.cpp",
  "source/spirv_fuzzer_options.cpp",
  "source/spirv_optimizer_options.cpp",
  "source/spirv_reducer_options.cpp",
  "source/spirv_target_env.cpp",
  "source/spirv_validator_options.cpp",
  "source/table.cpp",
  "source/text.cpp",
  "source/text_handler.cpp",

  "source/opt/fix_func_call_arguments.cpp",
  "source/opt/aggressive_dead_code_elim_pass.cpp",
  "source/opt/amd_ext_to_khr.cpp",
  "source/opt/analyze_live_input_pass.cpp",
  "source/opt/basic_block.cpp",
  "source/opt/block_merge_pass.cpp",
  "source/opt/block_merge_util.cpp",
  "source/opt/build_module.cpp",
  "source/opt/ccp_pass.cpp",
  "source/opt/cfg_cleanup_pass.cpp",
  "source/opt/cfg.cpp",
  "source/opt/code_sink.cpp",
  "source/opt/combine_access_chains.cpp",
  "source/opt/compact_ids_pass.cpp",
  "source/opt/composite.cpp",
  "source/opt/const_folding_rules.cpp",
  "source/opt/constants.cpp",
  "source/opt/control_dependence.cpp",
  "source/opt/convert_to_sampled_image_pass.cpp",
  "source/opt/convert_to_half_pass.cpp",
  "source/opt/copy_prop_arrays.cpp",
  "source/opt/dataflow.cpp",
  "source/opt/dead_branch_elim_pass.cpp",
  "source/opt/dead_insert_elim_pass.cpp",
  "source/opt/dead_variable_elimination.cpp",
  "source/opt/decoration_manager.cpp",
  "source/opt/debug_info_manager.cpp",
  "source/opt/def_use_manager.cpp",
  "source/opt/desc_sroa.cpp",
  "source/opt/desc_sroa_util.cpp",
  "source/opt/dominator_analysis.cpp",
  "source/opt/dominator_tree.cpp",
  "source/opt/eliminate_dead_constant_pass.cpp",
  "source/opt/eliminate_dead_functions_pass.cpp",
  "source/opt/eliminate_dead_functions_util.cpp",
  "source/opt/eliminate_dead_io_components_pass.cpp",
  "source/opt/eliminate_dead_members_pass.cpp",
  "source/opt/eliminate_dead_output_stores_pass.cpp",
  "source/opt/feature_manager.cpp",
  "source/opt/fix_storage_class.cpp",
  "source/opt/flatten_decoration_pass.cpp",
  "source/opt/fold.cpp",
  "source/opt/folding_rules.cpp",
  "source/opt/fold_spec_constant_op_and_composite_pass.cpp",
  "source/opt/freeze_spec_constant_value_pass.cpp",
  "source/opt/function.cpp",
  "source/opt/graphics_robust_access_pass.cpp",
  "source/opt/if_conversion.cpp",
  "source/opt/inline_exhaustive_pass.cpp",
  "source/opt/inline_opaque_pass.cpp",
  "source/opt/inline_pass.cpp",
  "source/opt/inst_debug_printf_pass.cpp",
  "source/opt/instruction.cpp",
  "source/opt/instruction_list.cpp",
  "source/opt/instrument_pass.cpp",
  "source/opt/interface_var_sroa.cpp",
  "source/opt/invocation_interlock_placement_pass.cpp",
  "source/opt/interp_fixup_pass.cpp",
  "source/opt/ir_context.cpp",
  "source/opt/ir_loader.cpp",
  "source/opt/licm_pass.cpp",
  "source/opt/liveness.cpp",
  "source/opt/local_access_chain_convert_pass.cpp",
  "source/opt/local_redundancy_elimination.cpp",
  "source/opt/local_single_block_elim_pass.cpp",
  "source/opt/local_single_store_elim_pass.cpp",
  "source/opt/loop_dependence.cpp",
  "source/opt/loop_dependence_helpers.cpp",
  "source/opt/loop_descriptor.cpp",
  "source/opt/loop_fission.cpp",
  "source/opt/loop_fusion.cpp",
  "source/opt/loop_fusion_pass.cpp",
  "source/opt/loop_peeling.cpp",
  "source/opt/loop_utils.cpp",
  "source/opt/loop_unroller.cpp",
  "source/opt/loop_unswitch_pass.cpp",
  "source/opt/mem_pass.cpp",
  "source/opt/merge_return_pass.cpp",
  "source/opt/modify_maximal_reconvergence.cpp",
  "source/opt/module.cpp",
  "source/opt/optimizer.cpp",
  "source/opt/pass.cpp",
  "source/opt/pass_manager.cpp",
  "source/opt/private_to_local_pass.cpp",
  "source/opt/propagator.cpp",
  "source/opt/reduce_load_size.cpp",
  "source/opt/redundancy_elimination.cpp",
  "source/opt/register_pressure.cpp",
  "source/opt/relax_float_ops_pass.cpp",
  "source/opt/remove_dontinline_pass.cpp",
  "source/opt/remove_duplicates_pass.cpp",
  "source/opt/remove_unused_interface_variables_pass.cpp",
  "source/opt/replace_desc_array_access_using_var_index.cpp",
  "source/opt/replace_invalid_opc.cpp",
  "source/opt/scalar_analysis.cpp",
  "source/opt/scalar_analysis_simplification.cpp",
  "source/opt/scalar_replacement_pass.cpp",
  "source/opt/set_spec_constant_default_value_pass.cpp",
  "source/opt/simplification_pass.cpp",
  "source/opt/spread_volatile_semantics.cpp",
  "source/opt/ssa_rewrite_pass.cpp",
  "source/opt/strength_reduction_pass.cpp",
  "source/opt/strip_debug_info_pass.cpp",
  "source/opt/strip_nonsemantic_info_pass.cpp",
  "source/opt/struct_cfg_analysis.cpp",
  "source/opt/switch_descriptorset_pass.cpp",
  "source/opt/trim_capabilities_pass.cpp",
  "source/opt/type_manager.cpp",
  "source/opt/types.cpp",
  "source/opt/unify_const_pass.cpp",
  "source/opt/upgrade_memory_model.cpp",
  "source/opt/value_number_table.cpp",
  "source/opt/vector_dce.cpp",
  "source/opt/workaround1209.cpp",
  "source/opt/wrap_opkill.cpp",

  "source/val/validate.cpp",
  "source/val/validate_adjacency.cpp",
  "source/val/validate_annotation.cpp",
  "source/val/validate_arithmetics.cpp",
  "source/val/validate_atomics.cpp",
  "source/val/validate_barriers.cpp",
  "source/val/validate_bitwise.cpp",
  "source/val/validate_builtins.cpp",
  "source/val/validate_capability.cpp",
  "source/val/validate_cfg.cpp",
  "source/val/validate_composites.cpp",
  "source/val/validate_constants.cpp",
  "source/val/validate_conversion.cpp",
  "source/val/validate_debug.cpp",
  "source/val/validate_decorations.cpp",
  "source/val/validate_derivatives.cpp",
  "source/val/validate_extensions.cpp",
  "source/val/validate_execution_limitations.cpp",
  "source/val/validate_function.cpp",
  "source/val/validate_id.cpp",
  "source/val/validate_image.cpp",
  "source/val/validate_interfaces.cpp",
  "source/val/validate_instruction.cpp",
  "source/val/validate_layout.cpp",
  "source/val/validate_literals.cpp",
  "source/val/validate_logicals.cpp",
  "source/val/validate_memory.cpp",
  "source/val/validate_memory_semantics.cpp",
  "source/val/validate_mesh_shading.cpp",
  "source/val/validate_misc.cpp",
  "source/val/validate_mode_setting.cpp",
  "source/val/validate_non_uniform.cpp",
  "source/val/validate_primitives.cpp",
  "source/val/validate_ray_query.cpp",
  "source/val/validate_ray_tracing.cpp",
  "source/val/validate_ray_tracing_reorder.cpp",
  "source/val/validate_scopes.cpp",
  "source/val/validate_small_type_uses.cpp",
  "source/val/validate_type.cpp",
  "source/val/basic_block_rtc_shim.cpp",
  "source/val/construct.cpp",
  "source/val/function_rtc_shim.cpp",
  "source/val/instruction_rtc_shim.cpp",
  "source/val/validation_state.cpp",
}

if (_PLATFORM_ANDROID) then
end

if (_PLATFORM_COCOA) then
end

if (_PLATFORM_IOS) then
end

if (_PLATFORM_LINUX) then
end

if (_PLATFORM_MACOS) then
end

if (_PLATFORM_WINDOWS) then
end

if (_PLATFORM_WINUWP) then
end