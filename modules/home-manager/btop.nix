{ config, pkgs, nix-colors, ... }:

{
  programs.btop = {
      enable = true;
      package = pkgs.btop-rocm;
      themes = {
          nix-colors-theme = ''
            theme[main_bg]="#${config.colorScheme.palette.base01}ff"
            theme[main_fg]="#${config.colorScheme.palette.base05}"
            theme[title]="#${config.colorScheme.palette.base02}"
            theme[hi_fg]="#${config.colorScheme.palette.base06}"
            theme[selected_bg]="#${config.colorScheme.palette.base07}"
            theme[selected_fg]="#${config.colorScheme.palette.base02}"
            theme[inactive_fg]="#${config.colorScheme.palette.base0D}"
            theme[graph_text]="#${config.colorScheme.palette.base02}"
            theme[meter_bg]="#${config.colorScheme.palette.base0D}"
            theme[proc_misc]="#${config.colorScheme.palette.base0A}"
            theme[cpu_box]="#${config.colorScheme.palette.base0A}"
            theme[mem_box]="#${config.colorScheme.palette.base05}"
            theme[net_box]="#${config.colorScheme.palette.base0E}"
            theme[proc_box]="#${config.colorScheme.palette.base09}"
            theme[div_line]="#${config.colorScheme.palette.base0D}"
            theme[temp_start]="#${config.colorScheme.palette.base0A}"
            theme[temp_mid]="#${config.colorScheme.palette.base07}"
            theme[temp_end]="#${config.colorScheme.palette.base06}"
            theme[cpu_start]="#${config.colorScheme.palette.base0A}"
            theme[cpu_mid]="#${config.colorScheme.palette.base09}"
            theme[cpu_end]="#${config.colorScheme.palette.base05}"
            theme[free_start]="#${config.colorScheme.palette.base00}"
            theme[free_mid]="#${config.colorScheme.palette.base07}"
            theme[free_end]="#${config.colorScheme.palette.base06}"
            theme[cached_start]="#${config.colorScheme.palette.base03}"
            theme[cached_mid]="#${config.colorScheme.palette.base09}"
            theme[cached_end]="#${config.colorScheme.palette.base05}"
            theme[available_start]="#${config.colorScheme.palette.base07}"
            theme[available_mid]="#${config.colorScheme.palette.base08}"
            theme[available_end]="#${config.colorScheme.palette.base0C}"
            theme[used_start]="#${config.colorScheme.palette.base0B}"
            theme[used_mid]="#${config.colorScheme.palette.base05}"
            theme[used_end]="#${config.colorScheme.palette.base0B}"
            theme[download_start]="#${config.colorScheme.palette.base0A}"
            theme[download_mid]="#${config.colorScheme.palette.base05}"
            theme[download_end]="#${config.colorScheme.palette.base09}"
            theme[upload_start]="#${config.colorScheme.palette.base08}"
            theme[upload_mid]="#${config.colorScheme.palette.base07}"
            theme[upload_end]="#${config.colorScheme.palette.base06}"
            theme[process_start]="#${config.colorScheme.palette.base05}"
            theme[process_mid]="#${config.colorScheme.palette.base04}"
            theme[process_end]="#${config.colorScheme.palette.base03}"
          '';
        }; 




      settings = {

        color_theme = "nix-colors-theme";
        theme_background = "False";
        truecolor = "True";
        force_tty = "False";
        presets = "\"cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty\"";
        vim_keys = "True";
        rounded_corners = "True";
        graph_symbol = "\"braille\"";
        graph_symbol_cpu =  "\"braille\"";
        graph_symbol_gpu = "\"braille\"";
        graph_symbol_mem = "\"braille\"";
        graph_symbol_net = "\"braille\"";
        graph_symbol_proc = "\"braille\"";
        shown_boxes = "mem cpu proc gpu0";
        update_ms = "2100";
        proc_sorting = "\"cpu lazy\"";
        proc_reversed = "False";
        proc_tree = "True";
        proc_colors = "True";
        proc_gradient = "True";
        proc_per_core = "False";
        proc_mem_bytes = "True";
        proc_cpu_graphs = "True";
        proc_info_smaps = "False";
        proc_left = "False";
        proc_filter_kernel = "False";
        proc_aggregate = "False";
        cpu_graph_upper = "\"Auto\"";
        cpu_graph_lower = "\"Auto\"";
        show_gpu_info = "\"Auto\"";
        cpu_invert_lower = "True";
        cpu_single_graph = "False";
        cpu_bottom = "False";
        show_uptime = "True";
        check_temp = "True";
        cpu_sensor = "\"Auto\"";
        show_coretemp = "True";
        temp_scale = "\"celsius\"";
        base_10_sizes = "False";
        show_cpu_freq = "True";
        clock_format = "\"%X\"";
        background_update = "True";
        mem_graphs = "True";
        mem_below_net = "False";
        zfs_arc_cached = "True";
        show_swap = "True";
        swap_disk = "True";
        show_disks = "True";
        only_physical = "True";
        use_fstab = "True";
        zfs_hide_datasets = "False";
        disk_free_priv = "False";
        show_io_stat = "True";
        io_mode = "True";
        io_graph_combined = "False";
        net_download = "100";
        net_upload = "100";
        net_auto = "False";
        net_sync = "True";
        base_10_bitrate = "\"Auto\"";
        show_battery = "True";
        selected_battery = "\"Auto\"";
        show_battery_watts = "True";
        log_level = "\"WARNING\"";
        nvml_measure_pcie_speeds = "True";
        rsmi_measure_pcie_speeds = "True";
        gpu_mirror_graph = "True";
	custom_gpu_name0 = "amdgpu";


      };
      };



}

