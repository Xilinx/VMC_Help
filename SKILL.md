# SKILL: Creating Block Help for New AI Engine Blocks

This document describes creating comprehensive block help documentation for new AI Engine blocks in Vitis Model Composer.

## Complete Documentation Package

A complete documentation package requires:

### VMC_Help Repository (`/AIE/<BlockName>/`)
1. **README.md** - Parameter documentation, examples section with GitHub links
2. **Images/** - `block.png` (generated with `block_screen_shot()`), example screenshots

### vmc_examples Repository (`/Examples/Block_Help/AIE/<BlockName>_Ex*/`)
1. **<BlockName>_Ex<N>.slx** - Simulink model with DUT subsystem, test harness, MATLAB reference, Hub configuration
2. **Supporting files** - Auto-generated: `code/`, `model_composer_work/`, `xmc_aie_lib/`

### Repository Coordination
- Both repos use same branch (e.g., `2026.1`)
- Examples must exist before README can reference them
- Screenshots from actual example models

## Workflows

**Workflow A: Examples Exist (PR)**
1. Checkout PR → 2. Test Examples → 3. Extract Parameters → 4. Create Help → 5. Generate Screenshots → 6. Commit

**Workflow B: Create from Scratch**
1. Create Examples → 2. Test/Verify → 3. Extract Parameters → 4. Create Help → 5. Generate Screenshots → 6. Commit Both Repos

---

## Testing Example Models

### Simulate and Verify
Use Model Composer MCP Server:

```matlab
cd /path/to/example/directory
open_system('ModelName');
sim('ModelName');

% Run vmcAnalyze
vmchub_set_param('ModelName/Vitis Model Composer Hub', 'ModelName/DUT', 'SelectSubsystem', 1);
vmcAnalyze('ModelName');
```

---

## Extracting Block Parameters

```matlab
% Get parameter list from block
block_path = 'ModelName/DUT/BlockName';
params = get_param(block_path, 'DialogParameters');
param_names = fieldnames(params);

% Print parameter names (use Prompt field for documentation)
for i = 1:length(param_names)
    param = params.(param_names{i});
    if isfield(param, 'Prompt')
        fprintf('%d. %s\n', i, param.Prompt);
    end
end
```

---

## Creating Block Help README.md

### Structure
Choose a similar block as template (matrix ops: Hadamard/GEMM; signal processing: FFT/FIR; simple: Cumulative_Sum).

Required sections:
1. Title and brief description
2. Block icon: `![](./Images/block.png)`
3. Library path: `AI Engine/DSP/<Buffer IO or Stream IO>`
4. Description (operation, I/O behavior, limitations, SSR)
5. Parameters (in dialog order, using exact Prompt names)
6. Examples with clickable image links
7. Copyright/license

### Parameter Documentation
- Use exact parameter name from dialog Prompt field
- List valid values with backticks (e.g., `int16`, `cfloat`)
- Note constraints and dependencies
- Copy standard rounding/saturation documentation from templates

### Examples Section
```markdown
## Examples

***Click on the images below to open each model.***

[![](./Images/BlockName_Ex1.png)](https://github.com/Xilinx/Vitis_Model_Composer/tree/2026.1/Examples/Block_Help/AIE/BlockName_Ex1)
```

---

## Generating Screenshots

### Block Icon
```matlab
open_system('ModelName');
block_screen_shot('ModelName/DUT/BlockName');  % Creates block.png
copyfile('block.png', '/path/to/VMC_Help/AIE/BlockName/Images/');
```

### Example Screenshots
```matlab
open_system('ModelName');
sim('ModelName');  % Run first to show Display values
print('-sModelName', '-dpng', '-r150', 'ModelName.png');
copyfile('ModelName.png', '/path/to/VMC_Help/AIE/BlockName/Images/');
```

---

## Creating Example Models from Scratch

### Strategy: Copy and Modify

1. **Find similar block** (same operation family)
2. **Copy example** to new directory
3. **Replace block** using Model Composer MCP Server
4. **Update parameters** for valid configuration
5. **Fix dimensions** in test harness
6. **Handle data formats** (row-major vs column-major)
7. **Test and verify**

### Replacing the Block

```matlab
cd /path/to/new/example
open_system('NewBlock_Ex1.slx');

% Replace block
old_block = 'NewBlock_Ex1/DUT/OldBlockName';
block_pos = get_param(old_block, 'Position');
delete_block(old_block);
add_block('XilinxModelComposer/AI Engine/DSP/Buffer IO/NewBlock', 'NewBlock_Ex1/DUT/NewBlock');
set_param('NewBlock_Ex1/DUT/NewBlock', 'Position', block_pos);

% Configure parameters
set_param('NewBlock_Ex1/DUT/NewBlock', 'param1', 'value1');

% Reconnect
delete_line('NewBlock_Ex1/DUT', 'In1/1', 'OldBlockName/1');
add_line('NewBlock_Ex1/DUT', 'In1/1', 'NewBlock/1', 'autorouting', 'on');
```

### Updating Test Harness Dimensions

```matlab
% Update input constants
set_param('NewBlock_Ex1/Constant2', 'Value', 'int16(randi([1,10],16,16))');

% Update output handling
set_param('NewBlock_Ex1/To Fixed Size', 'OutputSize', '16');
set_param('NewBlock_Ex1/Reshape', 'OutputDimensions', '[16,1]');
```

### Handling Data Formats

For column-major blocks (e.g., GEMV), remove Transpose blocks:

```matlab
% Delete transposes from row-major templates
delete_block('NewBlock_Ex1/Transpose');
delete_block('NewBlock_Ex1/Transpose1');
delete_block('NewBlock_Ex1/Transpose2');

% Connect directly
add_line('NewBlock_Ex1', 'Constant2/1', 'DUT/1', 'autorouting', 'on');
add_line('NewBlock_Ex1', 'DUT/1', 'To Fixed Size/1', 'autorouting', 'on');
```

### Verification Checklist

- [ ] Model opens without errors
- [ ] Simulation completes successfully
- [ ] vmcAnalyze passes without errors
- [ ] Block output matches MATLAB reference
- [ ] Dimensions correctly specified
- [ ] Data types match requirements

### Common AI Engine Constraints

- **Dimensions**: Often must be multiples of 16
- **Data format**: int16 typically requires column-major
- **SSR**: Some blocks only support SSR=1
- **Cascade**: Some blocks only support cascade=1
- **Data types**: Not all input/output combinations valid

Always check error messages and adjust parameters accordingly.

---

## Git Workflow

### Committing Examples (vmc_examples)
```bash
cd /path/to/vmc_examples/github
git add Examples/Block_Help/AIE/NewBlock_Ex*/
git commit -m "Add NewBlock example models

NewBlock_Ex1: 16x16, column-major, PASSED
NewBlock_Ex2: 32x32, column-major, PASSED

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Committing Documentation (VMC_Help)
```bash
cd /path/to/VMC_Help/github-help
git add AIE/BlockName/
git commit -m "Add BlockName block help

- Complete parameter documentation
- Block icon and example screenshots
- Links to N example models

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Quick Reference

### Standard Sections to Copy
- **Rounding mode**: 8 modes (Floor, Ceiling, Round to positive/negative infinity, etc.) - copy from template
- **Saturation mode**: 3 modes (None, Asymmetric, Symmetric) - copy from template
- **Constraints section**: Standard text about constraint manager - copy from template

### Parameter Name Format
Use exact text from block's Prompt field. Common patterns:
- Data types: `int16`, `int32`, `cint16`, `cint32`, `float`, `cfloat`
- Dimensions: "Rows in input A", "Columns in input B"
- Settings: Row-major(0), Column-major(1)

### File Locations
- Block help: `/VMC_Help/github-help/AIE/<BlockName>/README.md`
- Images: `/VMC_Help/github-help/AIE/<BlockName>/Images/`
- Examples: `/vmc_examples/github/Examples/Block_Help/AIE/<BlockName>_Ex*/`

---

## Troubleshooting

**Parameter names don't match**: Re-extract using `get_param(..., 'DialogParameters')` and use Prompt field

**Images wrong size**: Use `block_screen_shot()` for icons, `print('-sModel', '-dpng', '-r150', 'file.png')` for models

**Example links broken**: Verify examples exist, check branch name matches (2026.1, 2025.2), verify exact path

**Dimension errors**: Check multiples of 16, verify input constants match block requirements

**Data format errors**: Check if block requires row-major or column-major, add/remove Transpose blocks accordingly

---

Copyright (C) 2026 Advanced Micro Devices, Inc.
All rights reserved.

SPDX-License-Identifier: MIT
